require "electrb/version"
require 'jsonrpctcp'

module Electrb

  class Error < StandardError

    attr_accessor :id
    attr_accessor :jsonrpc

    # generate error form hash.
    # @param [Hash] hash hash of error.
    # @return [Electrb::Error]
    def self.from(hash)
      e = Electrb::Error.new(hash['error'])
      e.id = hash['id']
      e.jsonrpc = hash['jsonrpc']
      e
    end
  end

  autoload :Client, 'electrb/client'


  class ::Jsonrpctcp::RPCError

    def self.from_rpc_response(r)
      Electrb::Error.from(r)
    end

  end

end
