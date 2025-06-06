# frozen_string_literal: true

require_dependency "decidim/components/namer"

Decidim.register_component(:peertube_video) do |component|
  component.engine = Decidim::Peertube::Engine
  component.admin_engine = Decidim::Peertube::AdminEngine
  component.icon = "decidim/peertube/icon.svg"
  # component.permissions_class_name = "Decidim::Peertube::Permissions"

  # These actions permissions can be configured in the admin panel
  # component.actions = %w()

  component.settings(:global) do |settings|
    # Add your global settings
    settings.attribute :title, type: :string
    settings.attribute :video_url, type: :string
  end

  component.seeds do |participatory_space|
    # Add some seeds for this component
    admin_user = Decidim::User.find_by(
      organization: participatory_space.organization,
      email: "admin@example.org"
    )

    params = {
      name: Decidim::Components::Namer.new(participatory_space.organization.available_locales, :peertube_video).i18n_name,
      manifest_name: :peertube_video,
      published_at: Time.current,
      participatory_space:
    }

    component = Decidim.traceability.perform_action!(
      "publish",
      Decidim::Component,
      admin_user,
      visibility: "all"
    ) do
      Decidim::Component.create!(params)
    end
  end
end
