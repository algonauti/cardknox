# frozen_string_literal: true

RSpec.describe(Cardknox::API::Client) do
  subject { api }

  describe "Respond to" do
    it { is_expected.to(respond_to(:status)) }
    it { is_expected.to(respond_to(:transaction)) }
  end
end
