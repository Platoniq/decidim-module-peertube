# frozen_string_literal: true

module Decidim
  module Peertube
    class PeertubeUser < ApplicationRecord
      self.table_name = "decidim_peertube_users"

      belongs_to :user, class_name: "Decidim::User", foreign_key: "decidim_user_id"

      def access_token_valid?
        access_token.present? && access_token_expires_at.future?
      end

      def self.ransackable_attributes(_auth_object = nil)
        %w(id created_at updated_at)
      end

      def self.ransackable_associations(_auth_object = nil)
        %w(user)
      end
    end
  end
end
