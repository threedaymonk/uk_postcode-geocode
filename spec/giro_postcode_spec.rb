require "uk_postcode-geocode"

describe UKPostcode::GiroPostcode do
  let(:subject) { described_class.instance }

  describe "#country" do
    it "is England" do
      expect(subject.country).to eq(:england)
    end
  end
end
