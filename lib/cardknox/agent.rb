# frozen_string_literal: true

module Cardknox
  class Agent
    def initialize(endpoint)
      @conn = Faraday.new(endpoint) do |config|
        config.response(:raise_error)
        config.request(:json)
      end
    end

    def get(path, params = {})
      parse(@conn.get(path, params))
    end

    def post(path, body = {})
      parse(@conn.post(path, body))
    end

    private

    def parse(response)
      JSON.parse(response.body, symbolize_names: true).tap do |payload|
        if payload[:xStatus] != "Approved"
          raise Error::TransactionFailure.new(payload[:xError], response)
        end
      end
    rescue JSON::ParserError
      response.body
    end
  end
end
