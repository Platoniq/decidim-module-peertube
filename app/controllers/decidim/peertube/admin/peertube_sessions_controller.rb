# frozen_string_literal: true

module Decidim
  module Peertube
    module Admin
      class PeertubeSessionsController < Decidim::Admin::Components::BaseController
        include HasPeertubeSession

        # Every action is authorized by Decidim::Admin::Components::BaseController#enforce_component_permissions
        # (manage permission on the component, read for index and show), which this cop cannot see.
        # rubocop:disable Decidim/EnforcePermissionTo
        def new
          # enforce_permission_to :create, :peertube_session

          @form = Decidim::Peertube::PeertubeSessionForm.new
        end

        def create
          # enforce_permission_to :create, :peertube_session

          @form = form(Decidim::Peertube::PeertubeSessionForm).from_params(params)

          Decidim::Peertube::Authenticate.call(@form, current_user) do
            on(:ok) do
              flash[:notice] = I18n.t("peertube_sessions.create.success", scope: "decidim.peertube.admin")
              redirect_to root_path
            end

            on(:invalid) do
              flash.now[:alert] = I18n.t("peertube_sessions.create.invalid", scope: "decidim.peertube.admin")
              render action: "new"
            end
          end
        end

        def destroy
          # enforce_permission_to :destroy, :peertube_session

          current_peertube_user.destroy!

          flash.now[:notice] = I18n.t("peertube_sessions.destroy.success", scope: "decidim.peertube.admin")

          redirect_to root_path
        end
        # rubocop:enable Decidim/EnforcePermissionTo
      end
    end
  end
end
