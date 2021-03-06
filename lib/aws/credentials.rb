module Aws
  class Credentials

    # @param [String] access_key_id
    # @param [String] secret_access_key
    # @param [String] session_token (nil)
    def initialize(access_key_id, secret_access_key, session_token = nil)
      @access_key_id = access_key_id
      @secret_access_key = secret_access_key
      @session_token = session_token
    end

    # @return [String, nil]
    attr_accessor :access_key_id

    # @return [String, nil]
    attr_accessor :secret_access_key

    # @return [String, nil]
    attr_accessor :session_token

    # @return [Boolean] Returns `true` if the access key id and secret
    #   access key are both set.
    def set?
      !!(@access_key_id && @secret_access_key)
    end

    # @api private
    def inspect
      "#<#{self.class.name} @access_key_id=#{access_key_id}>"
    end

  end
end
