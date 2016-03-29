require 'spec_helper'

RSpec.describe ActiveAttrExtended do
  subject { model_class.new }

  let :model_class do
    Class.new do
      include ActiveAttr::Typecasting
    end
  end

  it 'has a version number' do
    expect(ActiveAttrExtended::VERSION).not_to be nil
  end

  it 'adds Array and Hash to the typecasters' do
    expect(subject.typecaster_for(Array)).to be_an_instance_of(ActiveAttrExtended::Typecasting::ArrayTypecaster)
    expect(subject.typecaster_for(Hash)).to be_an_instance_of(ActiveAttrExtended::Typecasting::HashTypecaster)
  end
end
