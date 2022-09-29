---
stoplight-id: d1lvjdxyj1wk4
---

# Authentication

Nayya uses API keys to authenticate requests. You can view and manage your API keys in the administration console.

Your API keys give anyone who has them access to read or manipulate your data, so be sure to **keep them safe!** Do not expose your secret API keys in areas accessible to the public such as source control, client-side code, etc.

Authentication to the API is performed via bearer auth. Simply include a header like so: `"Authorization: your_api_key"` and your request will get authenticated and authorized correctly.

All API requests must be made over [https](http://en.wikipedia.org/wiki/HTTP_Secure). Any calls made without authentication or made over http will fail.

## Rolling a Key
If you have a key that needs to be rolled because of a security breach or because of your security protocols, you may do so from the administration console.

Log into Nayya, and navigate to your API keys. You should see the option to "Roll Key," which will generate a new key for you to use. Once you submit the new key, any new requests made with the old key will fail, so **be sure to update your application with the new key before submitting.**