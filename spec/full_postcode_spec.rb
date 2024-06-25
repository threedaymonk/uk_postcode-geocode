require "csv"
require "uk_postcode-geocode"

describe "Full set of postcodes" do
  let(:sample_percent) {
    ENV.fetch("SAMPLE_PERCENT", 1).to_i
  }

  let(:csv_path) {
    File.expand_path("data/postcodes_#{sample_percent}.csv", __dir__)
  }

  let(:countries) {
    {
      "E92000001" => :england,
      "N92000002" => :northern_ireland,
      "S92000003" => :scotland,
      "W92000004" => :wales,
      "L93000001" => :channel_islands,
      "M83000003" => :isle_of_man
    }
  }

  let(:each_postcode) {
    ->(&blk) {
      CSV.foreach(csv_path, headers: [:postcode, :country]) do |row|
        country = countries.fetch(row[:country])
        outcode = row[:postcode][0, 4].strip
        incode  = row[:postcode][4, 3].strip
        blk.call outcode, incode, country
      end
    }
  }

  it "parses and finds the country of a postcode" do
    each_postcode.call do |outcode, incode, country|
      postcode = UKPostcode.parse(outcode + incode)
      expect(postcode.country).to eq(country)
    end
  end
end
