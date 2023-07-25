# Rack::Ratelimit Yabeda plugin

[Yabeda] plugin to collect metrics for [Rack::Ratelimit].

| Metric            | Type        | Tags                        | Description                                                        |
|-------------------|-------------|-----------------------------|--------------------------------------------------------------------|
| `requests_total`   | counter     | name | The total number of requests considered for rate limiting for a named ratelimit |
| `exceeded_requests_total`  | counter   | name | The total number of requests that exceeded a named rate limit |
| `clients_total`  | counter   | name | The total number of clients considered for rate limiting for a named ratelimit |
| `exceeded_clients_total`  | counter   | name | The total number of clients that exceeded a named rate limit |
| `quota_consumed_ratio`  | gauge   | name | The ratio of quota consumed to quota available for a named rate limit |

[Yabeda]: https://github.com/yabeda-rb/yabeda
[Rack::Ratelimit]: https://github.com/jeremy/rack-ratelimit
