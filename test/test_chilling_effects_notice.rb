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

  should "require title" do
    assert_raises ArgumentError do
      ChillingEffects::Notice.new :type => "foo"
    end
    assert ChillingEffects::Notice.new( :title => "foo", :type => "foo" )
  end

  should "require type" do
    assert_raises ArgumentError do
      ChillingEffects::Notice.new :title => "foo"
    end
    assert ChillingEffects::Notice.new( :title => "foo", :type => "foo" )
  end

  should "validate type" do
    assert_equal false, ChillingEffects::Notice.new(
      :title => "foo",
      :type => "bar",
    ).valid?
    assert ChillingEffects::Notice.new(
      :title => "foo",
      :type => "Dmca"
    ).valid?
  end

  should "validate language" do
    assert_equal false, ChillingEffects::Notice.new(
      :title => "foo",
      :type => "bar",
      :language => "baz"
    ).valid?
    assert ChillingEffects::Notice.new(
      :title => "foo",
      :type => "Dmca",
      :language => "zh"
    ).valid?
  end

  should "convert topic ids to topics" do
    notice = ChillingEffects::Notice.new(
      :title => "foo",
      :type => "bar",
      :topic_ids => [1,2,3]
    )
    assert_equal 3, notice.topics.size
  end

  should "list topic ids" do
    VCR.use_cassette('localhost', :record => :new_episodes) do
      notice = ChillingEffects::Notice.new(
        :title => "foo",
        :type => "bar",
        :topics => [ChillingEffects::Topic.find(1)]
      )
      assert_equal [1], notice.topic_ids
    end
  end

  should "convert sender_name" do
    notice = ChillingEffects::Notice.new(
      :title => "foo",
      :type => "bar",
      :sender_name => "bob"
    )
    assert_equal 1, notice.roles.length
  end

  should "round trip a notice" do
    VCR.use_cassette('localhost', :record => :new_episodes) do
      assert ChillingEffects::Notice.find(300000497).submit
    end
  end
end
