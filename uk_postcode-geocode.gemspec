$LOAD_PATH.unshift File.expand_path("../lib", __FILE__)
require "uk_postcode/geocode/version"

Gem::Specification.new do |s|
  s.name         = "uk_postcode-geocode"
  s.version      = UKPostcode::Geocode::VERSION
  s.summary      = "UK postcode geocoding"
  s.description  = "Adds geocoding to uk_postcode"
  s.author       = "Paul Battley"
  s.email        = "pbattley@gmail.com"
  s.homepage     = "http://github.com/threedaymonk/uk_postcode-geocode"
  s.license      = "MIT"
  s.files        = Dir["README.md", "COPYING.txt", "CHANGES", "lib/**/*"]
  s.require_path = "lib"

  s.add_development_dependency "rake", "~> 13"
  s.add_development_dependency "rspec", "~> 3"

  s.required_ruby_version = ">= 2.6"
end
