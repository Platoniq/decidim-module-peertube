# frozen_string_literal: true

$LOAD_PATH.push File.expand_path("lib", __dir__)

require "decidim/peertube/version"

Gem::Specification.new do |s|
  s.version = Decidim::Peertube::VERSION
  s.authors = ["Alejandro Puerta"]
  s.email = ["alejandro.puerta@nazaries.com"]
  s.license = "AGPL-3.0"
  s.homepage = "https://github.com/decidim/decidim-module-peertube"
  s.required_ruby_version = ">= 2.7"

  s.name = "decidim-peertube"
  s.summary = "A decidim peertube module"
  s.description = "Peertube implementation for Decidim."

  s.files = Dir["{app,config,lib}/**/*", "LICENSE-AGPLv3.txt", "Rakefile", "README.md"]

  s.add_dependency "decidim-admin", Decidim::Peertube::COMPACT_DECIDIM_VERSION
  s.add_dependency "decidim-core", Decidim::Peertube::COMPACT_DECIDIM_VERSION

  s.add_development_dependency "decidim-dev", Decidim::Peertube::COMPACT_DECIDIM_VERSION
end
