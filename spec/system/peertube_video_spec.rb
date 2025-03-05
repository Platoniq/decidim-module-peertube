# frozen_string_literal: true

require "spec_helper"
require "decidim/peertube/test/shared_contexts"

describe "Visit a peertube video component", :perform_enqueued do
  let(:organization) { create(:organization, available_locales: [:en]) }

  include_context "with an embed peertube_video component"

  before do
    switch_to_host(organization.host)
    visit decidim.root_path
    page.execute_script("$('#dc-modal-accept').click()")
    visit Decidim::EngineRouter.main_proxy(component).root_path
  end

  it "renders the peertube video component page" do
    expect(page).to have_css("iframe")
    expect(page).to have_content(component.settings.title)
    expect(page.find("iframe")[:src]).to eq(component.settings.video_url.gsub("watch", "embed"))
  end
end
