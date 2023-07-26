module Yabeda
  module Rack
    module Ratelimit
      module Instrumentation
        private
          def ratelimit_json(remaining, epoch)
            report_stats(remaining)
            super
          end

          def report_stats(remaining)
            quota_consumed_ratio = (1 - remaining.to_f / @max)

            Yabeda.rack_ratelimit.requests_total.increment({name: @name})
            Yabeda.rack_ratelimit.quota_consumed_ratio.set({name: @name}, quota_consumed_ratio)

            case remaining
            when @max - 1 # On the first request within a rate-limiting period
              Yabeda.rack_ratelimit.clients_total.increment({name: @name})
            when -1 # On the first request that exceeds the rate limit
              Yabeda.rack_ratelimit.exceeded_clients_total.increment({name: @name})
            end

            if remaining < 0
              Yabeda.rack_ratelimit.exceeded_requests_total.increment({name: @name})
            end
          end
      end
    end
  end
end
