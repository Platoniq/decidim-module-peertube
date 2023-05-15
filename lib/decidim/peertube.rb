# frozen_string_literal: true

# frozen_string_literal: true

require "decidim/peertube/admin"
require "decidim/peertube/admin_engine"
require "decidim/peertube/api"
require "decidim/peertube/engine"
require "decidim/peertube/component"

module Decidim
  module DecidimPeertube
    include ActiveSupport::Configurable

    def self.url(path)
      URI.join("https://#{Decidim::Peertube.host}", path).to_s
    end

    config_accessor :credentials do
      {
        client_id: ENV.fetch("PEERTUBE_CLIENT_ID", "fake-peertube-client-id"),
        client_secret: ENV.fetch("PEERTUBE_CLIENT_SECRET", "fake-peertube-client-secret")
      }
    end

    config_accessor :host do
      ENV.fetch("PEERTUBE_HOST", "peertube.plataformess.org")
    end
  end
end
