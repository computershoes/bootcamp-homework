Client-Server Model
Request Line,  Headers, Body
Body
Status Line, Headers, Body
400, 500
GET, POST
POST
Body
Body
The advantage of `curl` over the browser is that it can be used to directly download files from a server with a single command, rather than having to navigate through the browser with multiple clicks. `curl` also supports more protocols.
--request
-H
-I
,
Set-Cookie: cart=Bob
GET /cart HTTP/1.1
POST
Upgrade-Insecure-Requests: 1
Yes
Credentials
200 OK - successful response
Apache
Yes
The page content is likely html code.
Included security headers:
- Strict-Transport-Security: max-age=31536000; includeSubDomains
- X-Content-Type: NoSniff
- X-Frame-Options: DENY
- X-XSS-Protection: 1; mode=block
Containers
Backend server
 Containerization
`docker-compose`
.yml
`SELECT * FROM customers;`
`INSERT INTO employees (column) VALUES ('value')`
We would never run `DELETE FROM <table-name>;` by itself because it would delete all entries in the table.