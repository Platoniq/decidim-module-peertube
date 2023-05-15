# frozen_string_literal: true

module Decidim
  module Peertube
    module Api
      # This class allows to make requests to the Peertube API
      class Request
        attr_accessor :response

        protected

        def get(path)
          response = Faraday.get(api_path(path))

          @response = parse_response(response)
        end

        def get_authenticated(token, path)
          response = Faraday.get(api_path(path)) do |request|
            authorize(request, token)
          end

          @response = parse_response(response)
        end

        def post(path, params)
          response = Faraday.post(api_path(path), base_params.merge(params)) do |request|
          end

          @response = parse_response(response)
        end

        def post_authenticated(token, path, params = {})
          response = Faraday.post(api_path(path), base_params.merge(params)) do |request|
            authorize(request, token)
          end

          @response = parse_response(response)
        end

        def delete_authenticated(token, path, params = {})
          response = Faraday.delete(api_path(path), base_params.merge(params)) do |request|
            authorize(request, token)
          end

          raise Decidim::Peertube::Api::Error, response.body["error"] || response.status.to_s unless response.success?
        end

        private

        def authorize(request, token)
          request.headers["Authorization"] = "Bearer #{token}"
        end

        def api_path(path)
          URI.join(Decidim::Peertube::Api.base_url, path)
        end

        def base_params
          Decidim::Peertube.credentials
        end

        def parse_response(response)
          @response = JSON.parse(response.body).to_h

          raise Decidim::Peertube::Api::Error, @response["error"] if @response["error"]

          @response
        end
      end
    end
  end
end
