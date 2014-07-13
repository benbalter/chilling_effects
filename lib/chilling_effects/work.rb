module ChillingEffects
  class Work < Hashie::Trash

    include Hashie::Extensions::Coercion

    property :kind
    property :description
    property :infringing_urls_attributes, :from => :infringing_urls, with: lambda { |urls| urls.map { |url| url.symbolize_keys! } }
    property :copyrighted_urls_attributes, :from => :copyrighted_urls, with: lambda { |urls| urls.map { |url| url.symbolize_keys! } }

    coerce_key :copyrighted_urls_attributes, Array[ChillingEffects::CopyrightedUrl]
    coerce_key :infringing_urls_attributes, Array[ChillingEffects::InfringingUrl]

    alias_method :infringing_urls, :infringing_urls_attributes
    alias_method :copyrighted_urls, :copyrighted_urls_attributes
  end
end
