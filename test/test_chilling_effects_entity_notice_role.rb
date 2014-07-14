require_relative "helper"

class TestChillingEffectsEnityNoticeRole < Minitest::Test
  should "require name" do
    assert_raises ArgumentError do
      ChillingEffects::EntityNoticeRole.new
    end
    assert ChillingEffects::EntityNoticeRole.new( :name => "foo" )
  end

  should "validate Name" do
    assert_equal false, ChillingEffects::EntityNoticeRole.new( :name => "foo" ).valid?
    assert ChillingEffects::EntityNoticeRole.new( :name => "sender" ).valid?
  end
end
