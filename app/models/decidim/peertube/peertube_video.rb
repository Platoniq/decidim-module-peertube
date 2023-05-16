# frozen_string_literal: true

module Decidim
  module Peertube
    class PeertubeVideo < ApplicationRecord
      self.table_name = "decidim_peertube_videos"

      belongs_to :component, class_name: "Decidim::Component", foreign_key: "decidim_component_id"
      belongs_to :peertube_user, class_name: "Decidim::Peertube::PeertubeUser", foreign_key: "decidim_peertube_user_id"
    end
  end
end
