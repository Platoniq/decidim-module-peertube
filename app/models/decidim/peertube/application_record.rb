# frozen_string_literal: true

module Decidim
  module Peertube
    # Abstract class from which all models in this engine inherit.
    class ApplicationRecord < ApplicationRecord
      self.abstract_class = true
    end
  end
end
