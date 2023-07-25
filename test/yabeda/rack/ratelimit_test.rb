require "minitest/autorun"

require "rack/ratelimit"
require "yabeda/rack/ratelimit"
require "yabeda/testing"

class Yabeda::Rack::RatelimitTest < Minitest::Test
  def setup
    @app = ->(env) { [200, {}, []] }
    @limited = Rack::Ratelimit.new(@app, ratelimit_options)
  end

  def test_rate_limit_metrics_are_produced
    10.times do
      @limited.call("limit-by" => "key", "ratelimit.timestamp" => Time.now.to_f)
    end

    assert_equal 10, yabeda_counter_value(:requests_total, name: "myname")
    assert_equal 9, yabeda_counter_value(:exceeded_requests_total, name: "myname")
    assert_equal 1, yabeda_counter_value(:clients_total, name: "myname")
    assert_equal 1, yabeda_counter_value(:exceeded_clients_total, name: "myname")
    assert_equal 1000, yabeda_gauge_value(:quota_consumed_ratio, name: "myname")
  end

  private
    def ratelimit_options
      { name: "myname", rate: [ 1, 10 ], counter: Counter.new }
    end

    def yabeda_counter_value(counter, tags = {})
      Yabeda::TestAdapter.instance.counters.fetch(Yabeda.rack_ratelimit.public_send(counter))[tags]
    end

    def yabeda_gauge_value(gauge, tags = {})
      Yabeda::TestAdapter.instance.gauges.fetch(Yabeda.rack_ratelimit.public_send(gauge))[tags]
    end

  class Counter
    def initialize
      @counters = Hash.new do |classifications, name|
        classifications[name] = Hash.new do |timeslices, timestamp|
          timeslices[timestamp] = 0
        end
      end
    end

    def increment(classification, timestamp)
      @counters[classification][timestamp] += 1
    end
  end
end
