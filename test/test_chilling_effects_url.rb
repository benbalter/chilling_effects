require_relative "helper"

class TestChillingEffectsUrl < Minitest::Test
  should "require URLs" do
    assert_raises ArgumentError do
      ChillingEffects::Url.new
    end
      assert ChillingEffects::Url.new( :url => "http://foo.com" )
  end

  should "validate URLs" do
    assert_equal false, ChillingEffects::Url.new( :url => "foo" ).valid?
    assert ChillingEffects::Url.new( :url => "http://foo.com" ).valid?
  end
end
