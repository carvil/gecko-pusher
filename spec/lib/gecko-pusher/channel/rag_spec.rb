require 'spec_helper'

describe Gecko::Pusher::Channel::Rag do

  before(:each) do
    WebMock.reset!
    Gecko::Pusher.api_key = API_KEY
    @channel = Gecko::Pusher.channel(:rag, WIDGET_KEY)
  end

  it "should initiate a RAG channel" do
    @channel.should be_a(Gecko::Pusher::Channel::Rag)
  end

  it "should push RAG values" do
    data = {
      item: [
        { value: 100, text: "" },
        { value: 200, text: "" },
        { value: 300, text: "" }
      ]
    }
    stub = stub_gecko_post(WIDGET_KEY, data)
    @channel.push(100, 200, 300)
    stub.should have_been_requested
  end
end
