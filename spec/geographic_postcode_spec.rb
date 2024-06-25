require "uk_postcode-geocode"

describe UKPostcode::GeographicPostcode do
  describe "#country" do
    it "looks up the country of a full postcode" do
      expect(described_class.new("EH", "8", "8", "DX").country).to eq(:scotland)
    end

    it "looks up the country of a partial postcode" do
      expect(described_class.new("W", "1A").country).to eq(:england)
    end
  end
end
