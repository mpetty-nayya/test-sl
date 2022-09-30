---
stoplight-id: 4qxts1mktcxxq
---

# FAQ

## Authentication

### Replace a JWT Token

If you have a key that needs to be rolled because of a security breach or because of your security protocols, or because you lost you JWT Token, you may contact api@nayya.com

## Errors

### Contact Nayya about an error

`409` and `422` errors should provide enough information to fix the error without contacting Nayya.

`5xx` errors should be rare but sometimes provide enough information to prevent contacting Nayya.

Contact Nayya by emailing api@nayya.com with the [Request-Id](RequestIds.md) and a short description of the issue.

## Postman

### Does Nayya support Postman?

1. Browse to the [standard api](../reference/decision-support-api-standard.yaml) or [hropen api](../reference/decision-support-api-hropen.yaml).
2. Select `Exports / Bundled References` to download a self contained OpenAPI document of the Nayya API
3. Import the OpenAPI document as an API in Postman.  There is an option to generate collections during the OpenAPI import