require "active_attr"
require "active_attr_extended/version"
require "active_attr_extended/typecasting/array_typecaster"
require "active_attr_extended/typecasting/hash_typecaster"

module ActiveAttrExtended; end


# Reassign the typecaster mapping to include collections
ActiveAttr::Typecasting.module_eval { send(:remove_const, :TYPECASTER_MAP) }
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
  end
end
