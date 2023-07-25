# frozen_string_literal: true

require_relative "lib/yabeda/rack/ratelimit/version"

Gem::Specification.new do |spec|
  spec.name          = "yabeda-rack-ratelimit"
  spec.version       = Yabeda::Rack::Ratelimit::VERSION
  spec.authors       = ["Lewis Buckley"]
  spec.email         = ["lewis@37signals.com"]

  spec.summary       = "Instrumentation for Rack::Ratelimit"
  spec.homepage      = "https://github.com/basecamp/yabeda-rack-ratelimit"
  spec.license       = "MIT"
  spec.required_ruby_version = Gem::Requirement.new(">= 2.7")

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/basecamp/yabeda-rack-ratelimit"

  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject do |f|
      f.match(%r{^(test|spec|features|example|docs)/})
    end
  end
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "yabeda"
  spec.add_runtime_dependency "rack-ratelimit"

  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
end
