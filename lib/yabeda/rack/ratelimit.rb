# frozen_string_literal: true

require "yabeda"

Yabeda.configure do
  group :rack_ratelimit

  default_tag :name, "", group: :rack_ratelimit

  counter :requests_total, comment: "The total number of requests considered for rate limiting"
  counter :exceeded_requests_total, comment: "The total number of requests that exceeded rate limits"
  counter :clients_total, comment: "The total number of clients considered for rate limiting"
  counter :exceeded_clients_total, comment: "The total number of clients that exceeded rate limits"
  gauge   :quota_consumed_ratio, comment: "The ratio of quota consumed to quota available"
end

Yabeda.configure!

require_relative "ratelimit/instrumentation"
Rack::Ratelimit.prepend Yabeda::Rack::Ratelimit::Instrumentation
