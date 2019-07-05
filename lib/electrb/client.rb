require 'jsonrpctcp'

module Electrb

  class Client

    attr_reader :client

    def initialize(host, port)
      @client = Jsonrpctcp::Client.new(host, port)
    end

    private

    def method_missing(method, *args)
      send_request(method, *args)
    end

    def send_request(method, *args)
      method_name = method.to_s.gsub(/_/, '.')
      begin
        response = client.send(method_name, args)
        response['result']
      rescue Jsonrpctcp::RPCError => e
        raise Electrb::Error, e.message
      end
    end

  end

end