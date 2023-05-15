# frozen_string_literal: true

module Decidim
  module Peertube
    module Api
      class GetUserInfoRequest < Request
        # https://docs.joinpeertube.org/api-rest-reference.html#operation/getUserInfo

        def initialize(token:)
          get_authenticated(
            token,
            "users/me"
          )
        end
      end
    end
  end
end
