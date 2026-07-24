# frozen_string_literal: true

require "decidim/peertube/admin"
require "decidim/peertube/admin_engine"
require "decidim/peertube/api"
require "decidim/peertube/engine"
require "decidim/peertube/component"

module Decidim
  module Peertube
    class << self
      def config = self

      def configure
        yield self
      end

      def url(path)
        URI.join("https://#{Decidim::Peertube.host}", path).to_s
      end
    end

    mattr_accessor :credentials, default: {
      client_id: ENV.fetch("PEERTUBE_CLIENT_ID", "fake-peertube-client-id"),
      client_secret: ENV.fetch("PEERTUBE_CLIENT_SECRET", "fake-peertube-client-secret")
    }
    mattr_accessor :host, default: ENV.fetch("PEERTUBE_HOST", "peertube.plataformess.org")
  end
end
