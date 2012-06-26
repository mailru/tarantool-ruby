class Tarantool
  class TarantoolError < StandardError; end
  class UndefinedRequestType < TarantoolError; end
  class BadReturnCode < TarantoolError; end
  class StringTooLong < TarantoolError; end
  class ArgumentError < TarantoolError; end
  class UndefinedSpace < TarantoolError; end
  class UndefinedIndex < TarantoolError; end
  class ValueError < TarantoolError; end
end