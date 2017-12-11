
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "iplocate/version"

Gem::Specification.new do |spec|
  spec.name          = "iplocate"
  spec.version       = Iplocate::VERSION
  spec.authors       = ["Tally Tarik"]
  spec.email         = ["tally.tarik@gmail.com"]

  spec.summary       = %q{Find geolocation data from IP addresses}
  spec.description   = %q{Find geolocation data from IP addresses (e.g. city, country, timezone) using the IPLocate.io API}
  spec.homepage      = "https://github.com/tallytarik/ruby-iplocate"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_development_dependency "rest-client", "~> 2.0"
  spec.add_development_dependency "ipaddress", "~> 0.8"
  spec.add_development_dependency "activesupport", "~> 5.1"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  spec.add_development_dependency "rspec", "~> 3.0"
  spec.add_development_dependency "webmock", "~> 3.1"
end
