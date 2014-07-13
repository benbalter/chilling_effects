require "hashie"
require "faraday"
require "active_model"
require "active_support/core_ext"
require "validate_url"
require "json"
require_relative "chilling_effects/url"
require_relative "chilling_effects/copyrighted_url"
require_relative "chilling_effects/entity"
require_relative "chilling_effects/entity_notice_role"
require_relative "chilling_effects/file_upload"
require_relative "chilling_effects/infringing_url"
require_relative "chilling_effects/work"
require_relative "chilling_effects/notice"
require_relative "chilling_effects/topic"

module ChillingEffects

  class << self

    attr_writer :server
    attr_accessor :token

    def server
      @server || "https://chillingeffects.org/"
    end

    def notice(hash)
      ChillingEffects::Notice.new(hash)
    end

    def client
      @client ||= Faraday.new(:url => server)
    end

    def post(path, data)
      client.post do |request|
        request.url path
        request.headers['Content-Type'] = 'application/json'
        request.headers['AUTHENTICATION_TOKEN'] = token.to_s
        request.body = data
      end
    end

    def get(path)
      client.get do |request|
        request.url path
      end
    end

    def topics
      @topics ||= begin
        response = get("/topics.json")
        return unless response.success?
        topics = []
        JSON.parse(response.body)["topics"].each do |topic|
          topics.push ChillingEffects::Topic.new topic.symbolize_keys
        end
        topics
      end
    end

  end
end
