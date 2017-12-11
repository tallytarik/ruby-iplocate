# IPLocate for Ruby

Find geolocation data from IP addresses (e.g. city, country, timezone) using the [IPLocate.io](https://www.iplocate.io) API.

IPLocate.io provides 1,500 free requests per day. For higher plans, check out [the website](https://www.iplocate.io)

[![Gem Version](https://badge.fury.io/rb/iplocate.svg)](https://badge.fury.io/rb/iplocate)

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'iplocate'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install iplocate

## Usage

```ruby
require 'iplocate'

# Look up an IP address
results = IPLocate.lookup("8.8.8.8")

# Or with an API key
results = IPLocate.lookup("8.8.8.8", "abcdef")

results["country"]
# "United States"

results["country_code"]
# "US"

results["org"]
# "Google LLC"

results.inspect
# {
#   "ip"=>"8.8.8.8",
#   "country"=>"United States",
#   "country_code"=>"US",
#   "city"=>nil,
#   "continent"=>"North America",
#   "latitude"=>37.751,
#   "longitude"=>-97.822,
#   "time_zone"=>nil,
#   "postal_code"=>nil,
#   "org"=>"Google LLC",
#   "asn"=>"AS15169"
# } 
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/tallytarik/ruby-iplocate.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
