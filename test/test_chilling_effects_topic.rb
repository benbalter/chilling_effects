require_relative "helper"

class TestChillingEffectsTopic < Minitest::Test
  should "require name" do
    assert_raises ArgumentError do
      ChillingEffects::Topic.new :id => 1
    end
    assert ChillingEffects::Topic.new( :id => 1, :name => "foo" )
  end

  should "require id" do
    assert_raises ArgumentError do
      ChillingEffects::Topic.new :name => "foo"
    end
    assert ChillingEffects::Topic.new( :id => 1, :name => "foo" )
  end

  should "require parent ID to be an int" do
    assert_equal false, ChillingEffects::Topic.new(
      :id => 1,
      :name => "foo",
      :parent_id => "1.1"
    ).valid?
    assert_equal false, ChillingEffects::Topic.new(
      :id => 1,
      :name => "foo",
      :parent_id => "foo"
    ).valid?
    assert ChillingEffects::Topic.new(
      :id => 1,
      :name => "foo",
      :parent_id => 2
    ).valid?
  end

  should "find a topic by id" do
    VCR.use_cassette('localhost', :record => :new_episodes) do
      assert_equal ChillingEffects::Topic, ChillingEffects::Topic.find(1).class
    end
  end
end
