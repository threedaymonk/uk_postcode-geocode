require "uk_postcode/geocode/country_lookup"

module UKPostcode
  module CountryFinder
    module_function

    def country(postcode)
      normalized = [postcode.outcode, postcode.incode].compact.join
      COUNTRY_LOOKUP.each do |name, regexp|
        return name if normalized.match(regexp)
      end
      :unknown
    end
  end
end
