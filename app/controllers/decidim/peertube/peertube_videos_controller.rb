# frozen_string_literal: true

module Decidim
  module Peertube
    class PeertubeVideosController < Decidim::Components::BaseController
      helper PeertubeHelper

      # Decidim::Components::BaseController checks the read permission on the component
      def show; end # rubocop:disable Decidim/EnforcePermissionTo
    end
  end
end
