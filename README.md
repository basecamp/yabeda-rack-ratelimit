# yabeda-rack-ratelimit

![CI](https://github.com/basecamp/yabeda-rack-ratelimit/actions/workflows/ci.yml/badge.svg)
[![Gem Version](https://img.shields.io/gem/v/yabeda-rack-ratelimit.svg)](https://rubygems.org/gems/yabeda-rack-ratelimit)

[Yabeda] plugin to collect metrics for [Rack::Ratelimit].

## Get started

To install the latest version using [Bundler][bundler]:

```ruby
gem "yabeda-rack-ratelimit"
```

## Metrics

| Metric            | Type        | Tags                        | Description                                                        |
|-------------------|-------------|-----------------------------|--------------------------------------------------------------------|
| `requests_total`   | counter     | name | The total number of requests considered for rate limiting for a named ratelimit |
| `exceeded_requests_total`  | counter   | name | The total number of requests that exceeded a named rate limit |
| `clients_total`  | counter   | name | The total number of clients considered for rate limiting for a named ratelimit |
| `exceeded_clients_total`  | counter   | name | The total number of clients that exceeded a named rate limit |
| `quota_consumed_ratio`  | gauge   | name | The ratio of quota consumed to quota available for a named rate limit |

## Acknowledgments

yabeda-rack-ratelimit is [MIT-licensed](LICENSE.md) open-source software from [37signals](https://37signals.com/), the creators of [Ruby on Rails](https://rubyonrails.org).

---

© 2023 37signals, LLC.

[Yabeda]: https://github.com/yabeda-rb/yabeda
[Rack::Ratelimit]: https://github.com/jeremy/rack-ratelimit
[bundler]: https://bundler.io
[rubygems]: https://rubygems.org
