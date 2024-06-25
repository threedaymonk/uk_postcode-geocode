require "csv"
require_relative "./tree_builder"

COUNTRIES = {
  "E92000001" => :england,
  "N92000002" => :northern_ireland,
  "S92000003" => :scotland,
  "W92000004" => :wales,
  "L93000001" => :channel_islands,
  "M83000003" => :isle_of_man
}

tree_builder = TreeBuilder.new.tap { | t|
  CSV.new(ARGF, headers: [:postcode, :country]).each do |row|
    path = row[:postcode].scan(/\S/)
    t.insert path, COUNTRIES.fetch(row[:country])
  end
}.compress

puts <<END
module UKPostcode
  COUNTRY_LOOKUP = {
END
(COUNTRIES.values - [:northern_ireland]).each do |country|
  regexp = tree_builder.filter(country).regexp
  puts "    #{country}: #{regexp.inspect},"
end
puts <<END
    northern_ireland: /^BT/
  }
end
END
