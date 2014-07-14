require_relative "helper"

class TestChillingEffectsEnity < Minitest::Test
  should "require name" do
    assert_raises ArgumentError do
      ChillingEffects::Entity.new
    end
    assert ChillingEffects::Entity.new( :name => "foo" )
  end

  should "validate kind" do
    assert_equal false, ChillingEffects::Entity.new(
      :name => "foo",
      :kind => "bar"
    ).valid?
    assert ChillingEffects::Entity.new(
      :name => "sender",
      :kind => "individual"
    ).valid?
  end

  should "validate country code" do
    assert_equal false, ChillingEffects::Entity.new(
      :name => "foo",
      :kind => "individual",
      :country_code => "bar"
    ).valid?
    assert ChillingEffects::Entity.new(
      :name => "sender",
      :kind => "individual",
      :country_code => "us"
    ).valid?
  end
end
