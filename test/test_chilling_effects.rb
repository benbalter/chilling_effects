require_relative "helper"

class TestChillingEffects < Minitest::Test

  should "allow the server to be overrriden" do
    assert_equal "http://localhost:4000", ChillingEffects.server
  end

  should "store API Token" do
    token = "SUPER SECRET TOKEN"
    ChillingEffects.token = token
    assert_equal token, ChillingEffects.token
  end

  should "create a new faraday client" do
    assert_equal Faraday::Connection, ChillingEffects.client.class
  end

  should "retrieve the topics list" do
    VCR.use_cassette('localhost', :record => :new_episodes) do
      assert_equal ChillingEffects::Topic, ChillingEffects.topics.first.class
    end
  end

  should "get a URL" do
    VCR.use_cassette('localhost', :record => :new_episodes) do
      response = ChillingEffects.get "/"
      assert response.success?
    end
  end
end
