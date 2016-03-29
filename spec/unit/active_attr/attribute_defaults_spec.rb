require "spec_helper"
require "active_attr/attribute_defaults"

module ActiveAttr
  RSpec.describe AttributeDefaults do
    subject(:model) { model_class.new }

    let(:model_class) do
      Class.new do
        include InitializationVerifier
        include AttributeDefaults
        attribute :friends, default: []
        attribute :family, default: ['mother', 'father', 'brother', 'sister']
      end
    end

    describe "#attribute_defaults" do
      subject(:attribute_defaults) { model_class.new.attribute_defaults }

      it { is_expected.to be_a_kind_of Hash }

      it "includes declared empty array attribute defaults" do
        expect(subject["friends"]).to eq([])
      end

      it "includes declared populated array attribute defaults" do
        expect(subject["family"]).to eq(['mother', 'father', 'brother', 'sister'])
      end
    end
  end
end
