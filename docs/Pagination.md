---
stoplight-id: 6nwyn7h79oq7r
---

# Pagination

All top-level API resources have support for bulk fetches via "list" API methods. For instance, you can list employers, list employees, and list plans. These list API methods share a common structure, taking these parameters: `page` and `per_page`.  And share a common `meta` result structure giving the `current_page`, `total_pages` and `total_count`.

## Pagination Example

**Request**

```
GET https://app.nayya.com/api/employers?page=1&per_page=25
```

**Response**
```json
{
    data: [{...},{...}],
    meta: {
      current_page: 1,
      total_pages: 4,
      total_count: 100  
    }
}
```
