module Aws
  # @api private
  class RequestHandler

    def initialize(serializer)
      @serializer = serializer
    end

    attr_accessor :handler

    def call(context)
      populate_headers(context)
      populate_body(context)
      @handler.call(context)
    end

    def populate_headers(context)
      @serializer.populate_headers(context)
    end

    def populate_body(context)
      input = context.operation.input
      unless input.raw_payload? || input.payload_member.empty?
        if input.payload
          rules = input.payload_member
          params = context.params[input.payload] || {}
        else
          rules = input
          params = context.params
        end
        @serializer.populate_body(context, rules, params)
      end
    end

  end
end
