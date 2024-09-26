# frozen_string_literal: true

RSpec.describe(Cardknox::Webhook) do
  describe "#verify_signature" do
    let(:verify_signature) { subject.verify_signature(**args) }
    let(:args) do
      {
        params: received_params,
        signature: signature,
        secret_key: "okv8Gl0nUE7JzCD",
      }
    end

    let(:signature) { "48258A974F57553FF6A780E30C52A3B6" }

    let(:received_params) do
      {
        xAmount: "6.21",
        xCardLastFour: "1111",
        xCardType: "Visa",
        xCommand: "CC:Sale",
        xDigitalWalletType: "Unknown",
        xEnteredDate: "9/25/2024 11:54:29 AM",
        xEntryMethod: "Keyed",
        xExp: "1124",
        xMaskedAccountNum: "xxxxxxxxxxxx1111",
        xMaskedCardNumber: "4xxxxxxxxxxx1111",
        xRefNum: "10200264766",
        xRequestAmount: "6.21",
        xResponseAuthCode: "63642A",
        xResponseAVSCode: "NNN",
        xResponseRefNum: "10200264766",
        xResponseResult: "Approved",
        xToken: "3p942gh1gnqq41hp56m04708400gpgq1",
      }
    end

    context "with valid signature" do
      it { expect(verify_signature).to(be_truthy) }
    end

    context "with invalid signature" do
      let(:signature) { "wrong_signature" }

      it { expect(verify_signature).to(be_falsey) }
    end
  end
end
