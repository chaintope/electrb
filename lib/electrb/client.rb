module Electrb

  class Client

    attr_reader :client

    def initialize(host, port)
      @client = Jsonrpctcp::Client.new(host, port)
    end

    # Send RPC request.
    # @param [String] method_name Method name to be called by RPC.
    # @return [String] RPC result.
    def request(method_name, *args)
      send_request(method_name, *args)
    end

    private

    def send_request(method_name, *args)
      response = client.send(method_name, *args)
      response['result']
    end

  end

end