---
stoplight-id: 6nwyn7h79oq7r
---

# Pagination

All top-level API resources have support for bulk fetches via "list" API methods. For instance, you can list employers, list employees, and list plans. These list API methods share a common structure, taking at these parameters: `page` and `per_page`.  And share a common `meta` result structure giving the `current_page`, `total_pages` and `total_count`.
