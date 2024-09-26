# frozen_string_literal: true

module Cardknox
  module Webhook
    class << self
      def verify_signature(params:, secret_key:, signature:)
        sorted_values = params.to_h.sort_by do |key, _value|
          key.downcase
        end.map(&:last).join

        hexdigest = Digest::MD5.hexdigest(
          "#{sorted_values}#{secret_key}",
        ).upcase

        hexdigest == signature
      end
    end
  end
end
