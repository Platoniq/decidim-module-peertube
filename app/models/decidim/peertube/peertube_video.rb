# frozen_string_literal: true

module Decidim
  module Peertube
    class PeertubeVideo < ApplicationRecord
      self.table_name = "decidim_peertube_videos"

      belongs_to :component, class_name: "Decidim::Component", foreign_key: "decidim_component_id"
      belongs_to :peertube_user, class_name: "Decidim::Peertube::PeertubeUser", foreign_key: "decidim_peertube_user_id"

      def self.ransackable_attributes(_auth_object = nil)
        %w(id created_at updated_at)
      end

      def self.ransackable_associations(_auth_object = nil)
        %w(component peertube_user)
      end
    end
  end
end
