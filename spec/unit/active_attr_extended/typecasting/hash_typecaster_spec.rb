require "spec_helper"

module ActiveAttrExtended
  module Typecasting
    RSpec.describe HashTypecaster do
      subject { HashTypecaster.new }

      describe "#call" do
        let(:result) { subject.call(value) }

        context "value is nil" do
          let(:value) { nil }

          it "is an empty hash" do
            expect(result).to eq(Hash.new)
          end
        end

        context "value is a json encoded string" do
          let(:value) { {x: :y}.to_json }

          it "decodes the value" do
            expect(result).to eq({"x" => "y"})
          end
        end

        context "value is a hash" do
          let(:value) { {x: :y} }

          it "is the hash" do
            expect(result).to eq({x: :y})
          end
        end

        context "value is not a hash" do
          let(:value) { 1 }
          it "is an empty hash" do
            expect(result).to eq({})
          end
        end
      end
    end
  end
end

