# Database Schema
> This is a complete guide of the database structure

## Table Descriptions


### Extracts
| Name | Value | Default | Allow Null? | Description |
| --- | ---| --- | --- | --- |
| extractable_type | string | ~ | `false` |
| extractable_id | bigint | ~ | `false` |
| location_id | integer | `0` | `false` |
| migration_needed | boolean | `false` | `false` |
| all_items | boolean | `false` | `false` |
| quiet | boolean | `true` | `false` |
| logging | boolean | `true` | `false` |
| enabled | boolean | `true` | `false` |
| extract_frequency | text | ~ | `false` |
| extract_time | time | ~ | ~ |
| delimeter | text | `"TAB"` | `false` |
| extract_type | text | `"iwe7"` | `false` |
| db_name | text | ~ | ~ |
| item_flags | text | ~ | ~ |
| deleted_at | datetime | ~ | ~ |
| created_at | datetime | ~ | `false` |
| updated_at | datetime | ~ | `false` |

### Servers
| Name | Value | Default | Allow Null? | Description |
| --- | ---| --- | --- | --- |
| virtualized | boolean | ~ | ~ |
| retailer_id | integer | ~ | ~ |
| hostname | text | ~ | ~ |
| ip_address | text | ~ | ~ |
| platform | text | ~ | ~ |
| platform_version | text | ~ | ~ |
| postgresql_version | text | ~ | ~ |
| server_code | text | ~ | ~ |
| service_tag | text | ~ | ~ |
| timezone | text | ~ | ~ |
| deleted_at | datetime | ~ | ~ |
| created_at | datetime | ~ | `false` |
| updated_at | datetime | ~ | `false` |

### Users
| Name | Value | Default | Allow Null? | Description |
| --- | ---| --- | --- | --- |
| google_id | text | ~ | `false` |
| email | text | ~ | `false` |
| first_name | text | ~ | ~ |
| last_name | text | ~ | ~ |
| disabled | boolean | `false` | `false` |
| admin | boolean | `false` | `false` |
| created_at | datetime | ~ | `false` |
| updated_at | datetime | ~ | `false` |
