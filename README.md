# Chilling Effects Ruby Gem

A Ruby Gem for interacting with the Chilling Effects notice API

## Installation

`gem install chilling_effects`

or via Bundler, add to your `Gemfile`:

`gem 'chilling_effects'`

## Usage

### Configuring your API token

```ruby
ChillingEffects.token = "MY SUPER SECRET TOKEN"
```

### Specifying a non-standard host server

```ruby
ChillingEffects.server = "http://localhost:8000"
```

### Getting a list of topics

```ruby
ChillingEffects.topics
=> [{:id=>1, :name=>"Chilling Effects", :parent_id=>nil},
 {:id=>3, :name=>"Fan Fiction", :parent_id=>nil},
 {:id=>4, :name=>"References", :parent_id=>nil},
 {:id=>5, :name=>"Copyright", :parent_id=>nil},
 {:id=>6, :name=>"Trademark", :parent_id=>nil},
 {:id=>7, :name=>"Bookmarks", :parent_id=>nil},...]
```

### Finding a notice by ID

```ruby
ChillingEffects::Notice.find(300000497)
=> {:topic_ids=>[],
 :entity_notice_roles_attributes=>[],
 :file_uploads_attributes=>[],
 :topics=>["Chilling Effects", "Right of Publicity", "E-Commerce Patents"],
 :works_attributes=>
  [{:infringing_urls_attributes=>
     [{:url=>"http://example.com/bad/url_88"},
      {:url=>"http://example.com/bad/url_87"},...]
 :copyrighted_urls_attributes=>[{:url=>"http://example.com/original_work/url_0"}],
 :description=>"Batman Video"}],
 :jurisdiction_list=>["JP"],
 :id=>300000497,
 :type=>"Dmca",
 :title=>"Batman",
 :body=>nil,
 :date_sent=>"2014-05-26T18:09:50Z",
 :date_received=>"2014-06-16T18:09:50Z",
 :sender_name=>"Joe Lawyer",
 :principal_name=>"Steve Simpson",
 :recipient_name=>"Google",
 :tags=>["snakes", "disney", "movie"],
 :action_taken=>nil,
 :language=>"ht"}
```

### Submitting a notice

```ruby
work = ChillingEffects::Work.new({
  :kind             => "Software",
  :description      => "Some awesome thing",
  :copyrighted_urls => [
    :url => "http://foo.com"
  ],
  :infringing_urls  => [
    :url => "http://bar.com"
  ]
})
notice = ChillingEffects::Notice.new({
  :title => "Foo Notice",
  :type => "Dmca",
  :topic_ids => [1,2,3],
  :works => [ work ]
})
notice.submit
```

## API Documentation

For more information, see [The Chilling Effects API Documentation](https://github.com/berkmancenter/chillingeffects/blob/master/doc/api_documentation.mkd)
