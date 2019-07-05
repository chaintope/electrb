require 'spec_helper'

RSpec.describe Electrb::Client do

  describe 'send request' do
    it 'should get response' do
      c = double('RPC client')
      client = Electrb::Client.new("localhost", 50001)
      txid = 'd513c8fa051336fc8059958a7c99dc390c741a693503b67783392d0a84029bcb'
      allow(client).to receive(:client).and_return(c)
      allow(c).to receive('blockchain.transaction.get'.to_sym).and_return({'result': ""})
      expect(c).to receive('blockchain.transaction.get'.to_sym).with(txid).once
      client.blockchain_transaction_get(txid)
    end
  end

end