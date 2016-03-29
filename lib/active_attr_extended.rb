require "active_attr"
require "active_attr_extended/version"
require "active_attr_extended/typecasting/array_typecaster"
require "active_attr_extended/typecasting/hash_typecaster"

module ActiveAttrExtended; end


# Reassign the typecaster mapping to include collections
ActiveAttr::Typecasting.module_eval { send(:remove_const, :TYPECASTER_MAP) if defined?(ActiveAttr::Typecasting::TYPECASTER_MAP) }

module ActiveAttr
  module Typecasting
    # @private
    TYPECASTER_MAP = {
        Array      => ::ActiveAttrExtended::Typecasting::ArrayTypecaster,
        BigDecimal => BigDecimalTypecaster,
        Boolean    => BooleanTypecaster,
        Date       => DateTypecaster,
        DateTime   => DateTimeTypecaster,
        Float      => FloatTypecaster,
        Hash       => ::ActiveAttrExtended::Typecasting::HashTypecaster,
        Integer    => IntegerTypecaster,
        Object     => ObjectTypecaster,
        String     => StringTypecaster
    }.freeze

    # redefine for active_attr <= 0.7.0
    def typecaster_for(type)
      typecaster = TYPECASTER_MAP[type]
      typecaster.new if typecaster
    end
  end
end
