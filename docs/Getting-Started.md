---
stoplight-id: i6j8x0bd8k9bg
---

# Getting-Started

Nayya fits into your existing user flow to empower a seamless user experience. See the diagram below to see an overview.

As you can see, your platform hands off to Nayya for decision support with the expected outcome being a set of plans bookmarked by the employee. Your platform can then retrieve those plans to create a great user experience and enable employees to make the best elections for themselves and their families.

Integrating in this way with Nayya is really quite simple, and we'll go through each step in detail.

You'll perform three main steps:
  1. Mapping your system's entities to ours
  2. Writing requests to configure employers and employees in Nayya
  3. Embed our user experience into yours

**That's it!**
Let's look at this in more detail.

Nayya fits into your existing user flow to empower a seamless user experience. See the diagram below to see an overview.

<img src="/docs/overview.png" />

As you can see, your platform hands off to Nayya for decision support with the expected outcome being a set of plans bookmarked by the employee. Your platform can then retrieve those plans to create a great user experience and enable employees to make the best elections for themselves and their families.

Integrating in this way with Nayya is really quite simple, and we'll go through each step in detail.

You'll perform three main steps:
  1. Mapping your system's entities to ours
  2. Writing requests to configure employers and employees in Nayya
  3. Embed our user experience into yours

**That's it!**
Let's look at this in more detail.

## Step One: Mapping Entities
Nayya's entities are relatively basic and match up well with most benefit admin platforms.

Every `POST` request will include a response with the id or id's of the entities that you have created. Make sure that you store these ID's; they are required to further interact with this API.

This is typically done by storing the Nayya ID in your data store alongside your own internal ID that makes the entity unique. For example, you might have a table called `companies` that includes an `id` column. If that table maps to an Employer in the Nayya API, then you'll need to add a new column to your `companies` table called something like `nayya_external_id`. This is where you'll store the resulting ID of the creation request to the Nayya API.

Here is the list of entities that you'll need to plan for:
  - **Employer** (name, address, etc.)
  - **Plan** (name, type, rates, deductible, other metadata, etc.)
  - **Eligibility Group** (name)
  - This entity is used to map a plan to an employee.
  - Some examples of a group might be "Part-time", "Full-time", or other ways that an employer might want to group benefits for a select group of people.
  - **Open Enrollment** (start, end)
  - **Employee** (name, email, dob, last_four_ssn, etc.)

 The keys in your system that represent these entities should be prepared to be matched with keys from Nayya so that you can interact with the created entities once they are live.

 So how do you provide this data? On to Step Two!

 ## Step Two: Configuration
The creation and maintenance of this configuration data is expected and required to make Nayya’s decision support accurate and effective. Once we provide API credentials, your data will be a blank slate, ready for you to begin.

Let's walk through how to set up all the entities that were mapped in **Step One**.

### Employers
Employers are the hub of all other relations that you'll be configuring.

First, set up an employer using the **Add Employer** action:
```
// Add Employer

POST /api/employers

{ "name": "Employer Name", "address": "employer address", ... }
```

This will return a `201` with the Nayya ID for that employer, which will be in the form of a randomly-generated string.

**Make sure you store this ID!** You will need it in order to access almost all of the endpoints available to you in this API.

### Eligibility Groups
Next up are Eligibility Groups. These groups map an employee to a set of plans.

A plan belongs to one or more eligibility groups and an employee belongs to a single eligibility group. An employee is eligible for any plan that belongs to the same eligibility.

Simply perform the **Add Eligibility Group** action, and you are in business:

```
// Add Eligibility Group

POST /api/employers/{employer_id}/eligibility-groups

{"name": "Part Time"}
```

Since Plans belong to Eligibility Groups, you will need to create the Eligibility Groups first before creating Plans. This call will return a `201` and an ID for the Eligibility Group that you will need when creating a Plan for the group.

### Plans
Now that you have Eligibility Groups configured, let's make some plans and tie them together.  This is done at the time of creating the Plan by passing in a set of one or more Eligibility Group IDs when adding a new plan.

```
// Add Plan

POST /api/employers/{employer_id}/plans

{"name": "Major Medical Gold Plan", "medical_metadata": {...}, ... }
    ```
Just like all of our `POST` endpoints, this will return a `201` with an ID that you should save to reference in your system for future requests and mapping of users to their choices.

And that's that! We can now enter employees into the system and get them ready to make some great decisions.

**NOTE**
Adding new plans requires more data than the other entities in our system, and the documentation should be read carefully to make sure that all of the required data is supplied and will display correctly in the Nayya user experience.

### Employees
We now arrive at employees.

Employees can be added in bulk, since you likely want to dump a large amount of them to us up front, though the endpoint does handle adding one at a time, if that is your preference.

```
// Add One or More Employees

POST /api/employer/{employer_id}/employees

[{"first_name": "Gloria", ...}, {"first_name": "Antoine", ...}]
```

ID's for all added employees are returned in a `201` request so that you can map them to users in your system.

### Open Enrollments
This is the last piece of configuration we need to allow employees to access the Nayya experience.

Open enrollments have start and end dates that determine when users can access the decision support tool.

If no open enrollment is live for an employee, they will be directed to our main menu and told that decision support is not available outside of open enrollments.

Setting one up is quite easy, much like the other entities:

```
// Add an Open Enrollment

POST /api/employers/{employer_id}/open-enrollments

{"from": "2021-01-01", "to": "2021-02-02", "published": true}
```

Configuration is now done! Let's finalize the integration by embedding the Nayya experience in your web app in **Step Three.**

# Step Three - Embed Nayya App
For a seamless user flow, Nayya can be embedded in an iframe directly in your web app.

Before starting, ensure that you have received both an API key as well as your Nayya User key. You will need them both for the embedding process.

You can achieve this in five steps:
### 1. Locate Transition Point

First, locate the transition point in your user flow where it makes sense to go through Nayya decision support.

This should be before the employee is directed to select any plans that they'd like to participate in.

### 2. Add the iframe to your application.

It will look something like this:

```
<iframe
  src="https://app.nayya.com/choose/embed?token=<your token>"
  title="Nayya"
  width="1200px"
  height="900px">
</iframe>
```

### 3. Choose a secret for signing

Nayya accepts a JWT token signed with RS256 encoding as authentication. You will need to create a private/public key combination, providing Nayya with the public key so that we can verify you as the signer.

Log into the developer console to create or update your Embedded Public Key.

### 4. Encode and Add JWT to URL

Add a signed JWT with authorization information and a exit URL as a `GET` param to the URL above.

There's a <a href="http://jwt.io/" target="_blank">lot of good information</a> out there on creating and managing JWT's, if you need help getting started working with them. The below example is merely psueodocode, but should give you an idea of the payload required when creating and signing.

```
// pseudocode

payload = {
  "iss": "Your Platform",
  "exit_url": "https://your.desired.redirect",
  "usid": "3aoprgpahg2-auohpga4-78ef-2oi9-fc5w",
  "empe": "auohpga4-78ef-2oi9-fc5w-3aoprgpahg2",
  "exp": 1613682529,
  "iat": 1516239022
}
token = signToken(issueInfo, payload)
```

You'll need to append this token as a parameter to the URL you provide the iframe, so it will end up looking like this:

```
<iframesrc="https://app.nayya.com/choose/embed?token=eyJhbGciOiJSUzI1NiJ9.eyJpc3MiOiJUZXN0IElzc3VlciIsImVtcGUiOiI4NWNiODI2ZS01N2ViLTQ3ZGMtYTA4OC04YjUxZDM4OWJhMzYiLCJ1c2lkIjoiODAyMTRlNGUtOGIyZS00YTk4LTljMDEtNDQ3MTNkOGQ1YTM0IiwiZXhpdF91cmwiOiJodHRwczovL3N0YWdpbmcubmF5eWEuY29tLyIsImV4cCI6MTcwMjg1NzIwOCwiaWF0IjoxNjAyODUzNjA4fQ.Ccomi8oVU1Kao0S25SghA-hs_qxA9_e8IU499G52AgRLVW9tu-XPCQn_jVFYJ8Z80CPG65X8vePgcIXE5bJwiHif9gQJ3lNERcfrRMyPNGdXeZC9irNr3LkNaZafK9qlTNiPK1pBplCbGMsXJTteRzi_of86SA1xbOXXzcG0Zuwr_MUvZgXlJP2iLmqNvJxG66W3L4xPCxs0C1ayqfCZOOzf5l_9B-PeTxUKdcI8HcBY7_okNHuTHBPigDGDiFAKwZEIZVkQepM6_jzLmzvuhBw0Gz7OedBiO2Ro8q1wMDpSvP0aj6PyfjN6GCRNhehfXrmmyhObW4ZehHb8efjVcQ"
  title="Nayya"
  width="1200px"
  height="900px">
</iframe>
```

### 5. Fetch Employee-Bookmarked Plans from Nayya

Pull the user's plan choices from Nayya at: `GET /api/employees/{employee_id}/choices`

We'd recommend that the exit_url you provide in the JWT should be a route that will synchronously request employee choices from Nayya, cache them in your system, then optionally bust the iframe and redirect the user to the appropriate page to finalize their decisions in your system.

This has worked really well in our experience!