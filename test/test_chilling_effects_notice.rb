require_relative "helper"

class TestChillingEffectsNotice < Minitest::Test
  should "find a notice by ID" do
    VCR.use_cassette('localhost', :record => :new_episodes) do
      assert_equal ChillingEffects::Notice, ChillingEffects::Notice.find(300000497).class
    end
  end

  should "submit a notice" do
    VCR.use_cassette('localhost', :record => :new_episodes) do
      notice = ChillingEffects::Notice.new :title => "foo", :type => "Dmca"
      assert notice.submit
    end
  end
end
