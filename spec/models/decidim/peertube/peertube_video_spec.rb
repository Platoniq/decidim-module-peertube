# frozen_string_literal: true

require "spec_helper"

module Decidim
  module Peertube
    describe PeertubeVideo do
      describe ".ransackable_attributes" do
        it "returns an array of allowed attributes" do
          result = described_class.ransackable_attributes
          expect(result).to be_an(Array)
          expect(result).to eq(%w(id created_at updated_at))
        end

        it "accepts auth_object parameter" do
          result = described_class.ransackable_attributes("test")
          expect(result).to be_an(Array)
        end
      end

      describe ".ransackable_associations" do
        it "returns an array of allowed associations" do
          result = described_class.ransackable_associations
          expect(result).to be_an(Array)
          expect(result).to eq(%w(component peertube_user))
        end

        it "accepts auth_object parameter" do
          result = described_class.ransackable_associations("test")
          expect(result).to be_an(Array)
        end
      end
    end
  end
end
