---
stoplight-id: d1lvjdxyj1wk4
---

# Authentication

The Nayya API uses JWT Tokens to authenticate requests. 

Your JWT Tokens allow read and write acces to your data, so be sure to **keep them secure!**.  Do not expose your secret API keys in areas accessible to the public such as source control, client-side code, etc.

Authentication to the API is performed via Bearer Auth. Simply include a header like so: `"Authorization: Bearer your_api_key"` and your request will get authenticated and authorized correctly.

All API requests must be made over [https](http://en.wikipedia.org/wiki/HTTP_Secure). Any calls made without authentication or made over http will fail.

## New JWT Token

If you have a key that needs to be rolled because of a security breach, or because of your security protocols, you may contact api@nayya.com for a new JWT Token.