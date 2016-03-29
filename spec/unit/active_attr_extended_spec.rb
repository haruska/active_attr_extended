require 'spec_helper'

RSpec.describe ActiveAttrExtended do
  it 'has a version number' do
    expect(ActiveAttrExtended::VERSION).not_to be nil
  end

  it 'adds Array and Hash to the typecasters' do
    expect(ActiveAttr::Typecasting::TYPECASTER_MAP[Array]).to eq(ActiveAttrExtended::Typecasting::ArrayTypecaster)
    expect(ActiveAttr::Typecasting::TYPECASTER_MAP[Hash]).to eq(ActiveAttrExtended::Typecasting::HashTypecaster)
  end
end
