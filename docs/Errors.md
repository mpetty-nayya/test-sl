---
stoplight-id: 58a4ehyp77tub
---

# Errors

Nayya uses conventional HTTP response codes to indicate success or failure of an API request.  In general, codes in the `2xx` range indicate success.  Codes in the `4xx` range indicate an error with the provided information (e.g., a required parameter was omitted, a business rule failed, etc.).  Codes in the 5xx range indicate an  error with Nayya servers.


## HTTP Status Code Summary
Code | Summary 
---------|----------
 **200 - OK** | Everything worked as expected. 
**401 - Unauthorized** | No valid API key provided.
**403 - Forbidden** | The API key doesn't have permissions to perform the request.
**404 - Not Found** |	The requested resource doesn't exist.
**409 - Conflict** | The parameters were valid but the request failed.
**422 - Invalid** | The parameters were invalid
**500, 502, 503, 504 - Server Errors** | Something went wrong on Stripe's end. (These are rare.)

Related guide: [Errors FAQ](FAQ.md#errors)
 
