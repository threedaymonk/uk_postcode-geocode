# uk_postcode-geocode

Add geocoding to the `uk_postcode` gem.

## Usage

Find the country of a full or partial postcode (if possible: some outcodes span
countries):

```ruby
UKPostcode.parse("W1A 1AA").country # => :england
UKPostcode.parse("BT4").country # => :northern_ireland
UKPostcode.parse("CA6").country # => :unknown
UKPostcode.parse("CA6 5HS").country # => :scotland
UKPostcode.parse("CA6 5HT").country # => :england
```

The country returned for a postcode is derived from the [ONS Postcode
Directory][onspd] and might not always be correct in a border region:

> Users should note that postcodes that straddle two geographic areas will be
> assigned to the area where the mean grid reference of all the addresses
> within the postcode falls.

## Testing

To run the test suite:

```sh
$ rake
```

The full list of UK postcodes is not included in the repository due to its
size, but will be fetched automatically from [mySociety][mys].

If you are running an automatic build process, please find a way to cache these
files between runs.

## Licensing

You may use this library according to the terms of the MIT License; see
COPYING.txt for details.

The regular expressions in `country_lookup.rb` are derived from the ONS
Postcode Directory according to the terms of the
[Open Government Licence][onspd-lic].

> Under the terms of the Open Government Licence (OGL) […] anyone wishing to
> use or re-use ONS material, whether commercially or privately, may do so
> freely without a specific application for a licence, subject to the
> conditions of the OGL and the Framework. Users reproducing ONS content must
> include a source accreditation to ONS.

In order to avoid the restrictive commercial terms of the Northern Ireland
data in the ONSPD, this is not used to generate the regular expressions.
Fortunately, Northern Ireland postcodes are very simple: they all start with
`BT`!

[mys]: http://parlvid.mysociety.org/os/
[onspd]: http://www.ons.gov.uk/ons/guide-method/geography/products/postcode-directories/-nspp-/index.html
[onspd-lic]: http://www.ons.gov.uk/ons/guide-method/geography/beginner-s-guide/licences/index.html
