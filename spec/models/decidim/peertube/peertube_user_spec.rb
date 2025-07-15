# frozen_string_literal: true

require "spec_helper"

module Decidim
  module Peertube
    describe PeertubeUser do
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
          expect(result).to eq(%w(user))
        end

        it "accepts auth_object parameter" do
          result = described_class.ransackable_associations("test")
          expect(result).to be_an(Array)
        end
      end

      describe "#access_token_valid?" do
        let(:user) { described_class.new }

        it "returns true when access_token is present and not expired" do
          user.access_token = "valid_token"
          user.access_token_expires_at = 1.hour.from_now
          expect(user.access_token_valid?).to be true
        end

        it "returns false when access_token is blank" do
          user.access_token = nil
          expect(user.access_token_valid?).to be false
        end

        it "returns false when access_token is expired" do
          user.access_token = "expired_token"
          user.access_token_expires_at = 1.hour.ago
          expect(user.access_token_valid?).to be false
        end
      end
    end
  end
end
