require "spec_helper"

module ActiveAttrExtended
  module Typecasting
    RSpec.describe ArrayTypecaster do
      subject { ArrayTypecaster.new }

      describe "#call" do
        let(:result) { subject.call(value) }

        context "value is nil" do
          let(:value) { nil }

          it "is nil" do
            expect(result).to be_nil
          end
        end

        context "value is a json encoded string" do
          let(:value) { %w(my json array).to_json }

          it "decodes the value" do
            expect(result).to eq(%w(my json array))
          end
        end

        context "value is an array" do
          let(:value) { %w(my json array) }

          it "is the array" do
            expect(result).to eq(value)
          end
        end

        context "value is not an array" do
          context "value responds to to_a" do
            let(:value) { Time.new }

            it "is the resulting to_a array" do
              expect(result).to eq(value.to_a)
            end
          end

          context "value does not respond to to_a" do
            let(:value) { 1 }

            it "wraps the value in a singleton array" do
              expect(result).to eq([1])
            end
          end
        end
      end
    end
  end
end
