# Cardknox

A lightweight Ruby client for interacting with the Cardknox API, built using `faraday`. It provides an easy and minimal setup for handling payments and other operations via Cardknox.

![CI](https://github.com/algonauti/cardknox/actions/workflows/ci.yml/badge.svg)

## Usage

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'cardknox'
```

## Usage

```ruby
api = Cardknox::API::Client.new('your_api_key') do |config|
  config.gateway_version = "5.0.0"
  config.software_name = "Cardknox ruby client"
  config.software_version = Cardknox::VERSION
end

response = api.transaction("cc:Sale", {
  xCardNum: "4111111111111111",
  xExp: "1225",
  xAmount: "999"
})

```

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/algonauti/cardknox.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
