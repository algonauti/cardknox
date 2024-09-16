# frozen_string_literal: true

module Cardknox
  class Error < StandardError
    attr_reader :response

    def initialize(exception = nil, response = nil)
      @response = response

      super(exception)
    end

    class TransactionFailure < self
    end
  end
end
