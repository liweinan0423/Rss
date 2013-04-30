require 'test_helper'
require 'rss/push_client'
class PushClientTest < ActiveSupport::TestCase
  test "send broadcast" do
    push_client = ::RSS::PushClient.new 'http://10.32.152.132:8080/Androidpn/ws/nfws'

    response = push_client.send_broadcast '', '', '', ''

    assert response.include? "ns2:sendBroadcastResponse"
  end
end