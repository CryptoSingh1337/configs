# Host Project on subdomain

1. First make sure that the VPS ip address is static.
2. Create a `A` type DNS record with the value of VPS ip address.
3. Create a `CNAME` type DNS record with the value of the type `A` DNS record.

For example:
|  Type |              Host             |           Value           |  TTL  |
|:-----:|:-----------------------------:|:-------------------------:|:-----:|
|   A   |   `lexical.saranshkumar.live`   |        `192.168.0.1`        | 86400 |
| CNAME | `www.lexical.saranshkumar.live` | `lexical.saranshkumar.live` | 86400 |
