require "spec_helper"
require "active_attr/typecasting"

module ActiveAttr
  RSpec.describe Typecasting do
    subject(:model) { model_class.new }

    let :model_class do
      Class.new do
        include Typecasting
      end
    end

    describe "#typecaster_for" do
      it "returns ArrayTypecaster for Array" do
        expect(model.typecaster_for(Array)).to be_a_kind_of(ActiveAttrExtended::Typecasting::ArrayTypecaster)
      end

      it "returns HashTypecaster for Hash" do
        expect(model.typecaster_for(Hash)).to be_a_kind_of(ActiveAttrExtended::Typecasting::HashTypecaster)
      end
    end
  end
end
