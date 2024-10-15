# frozen_string_literal: true

RSpec.describe(Cardknox::API::Client) do
  subject { api }

  describe "Respond to" do
    it { is_expected.to(respond_to(:status)) }
    it { is_expected.to(respond_to(:transaction)) }
    it { is_expected.to(respond_to(:report)) }
  end
end
