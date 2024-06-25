require "uk_postcode"
require "uk_postcode/geocode/country_finder"

module UKPostcode
  class AbstractPostcode
    def country
      :unknown
    end
  end

  class GeographicPostcode < AbstractPostcode

    # Find the country associated with the postcode. Possible values are
    # :england, :scotland, :wales, :northern_ireland, :isle_of_man,
    # :channel_islands, or :unknown.
    #
    # Note that, due to limitations in the underlying data, the country might
    # not always be correct in border regions.
    #
    def country
      CountryFinder.country(self)
    end
  end

  class GiroPostcode < AbstractPostcode

    # GIR 0AA is in England. (In Bootle, in fact.)
    #
    def country
      :england
    end
  end
end
