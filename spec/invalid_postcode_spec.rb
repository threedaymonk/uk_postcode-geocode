require "uk_postcode-geocode"

describe UKPostcode::InvalidPostcode do
  let(:subject) { described_class.new("anything") }

  describe "#country" do
    it "is unknown" do
      expect(subject.country).to eq(:unknown)
    end
  end
end
