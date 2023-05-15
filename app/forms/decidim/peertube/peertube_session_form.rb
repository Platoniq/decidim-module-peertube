# frozen_string_literal: true

module Decidim
  module Peertube
    class PeertubeSessionForm < Decidim::Form
      attribute :username, String
      attribute :password, String

      validates :username, :password, presence: true
    end
  end
end
