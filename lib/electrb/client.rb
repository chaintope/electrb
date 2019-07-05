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
      response = client.send(method_name, *args)
      response['result']
    end

  end

end