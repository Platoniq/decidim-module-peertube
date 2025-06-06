# frozen_string_literal: true

shared_context "with stubs example api" do
  let(:base_url) { "example.org" }
  let(:api_url) { "https://api.example.org/" }
  let(:http_method) { :get }
  let(:http_status) { 200 }
  let(:data) { {} }
  let(:headers) { {} }

  before do
    allow(Decidim::Peertube).to receive(:host).and_return(base_url)
    allow(Decidim::Peertube::Api).to receive(:base_url).and_return(api_url)
    stub_request(http_method, /api\.example\.org/)
      .to_return(status: http_status, body: data.to_json, headers:)
  end

  def stub_api_request(method: :get, data: {}, headers: {}, status: 200)
    stub_request(method, /api\.example\.org/)
      .to_return(status:, body: data.to_json, headers:)
  end
end

shared_examples "returns an object" do |property|
  it "returns an object with the result" do
    expect(subject.result).to be_a Hash
    expect(subject.result.keys).to(include?(property)) if property.present?
  end
end

shared_context "with an embed peertube_video component" do
  include_context "with a component" do
    let(:manifest_name) { "peertube_video" }
    let(:title) { "A Peertube video" }
    let(:video_url) { "https://peertube.plataformess.org/videos/watch/ab236f8a-d17c-4ccf-b2dd-757ab4324dde" }

    let(:settings) do
      {
        title:,
        video_url:
      }
    end

    before do
      component.settings = settings
      component.save!

      visit_component
    end
  end
end

shared_context "with a live peertube_video component" do
  include_context "with a component" do
    let(:manifest_name) { "peertube_video" }
    let(:title) { "A Peertube video" }
    let(:peertube_user) { create(:peertube_user, user:) }
    let(:peertube_video) { create(:peertube_video, user: peertube_user, component:) }

    let(:settings) do
      {
        title:
      }
    end

    before do
      component.settings = settings
      component.save!

      visit_component
    end
  end
end
