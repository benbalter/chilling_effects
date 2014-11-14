module ChillingEffects
  class Notice < Hashie::Trash

    include ActiveModel::Validations
    include Hashie::Extensions::Coercion

    TYPES = %w[
      CourtOrder
      Defamation
      Dmca
      LawEnforcementRequest
      Other
      PrivateInformation
      Trademark
    ]

    LANGUAGES = %w[
      af
      ar
      be
      bg
      ca
      cs
      cy
      da
      de
      el
      en
      eo
      es
      et
      fa
      fi
      fr
      ga
      gl
      hi
      hr
      ht
      hu
      id
      is
      it
      iw
      ja
      ko
      lt
      lv
      mk
      ml
      ms
      mt
      nl
      no
      pl
      pt
      ro
      ru
      si
      sk
      sl
      sq
      sr
      sv
      sw
      th
      tl
      tr
      uk
      vi
      yi
      yo
      zh
    ]

    property :title, :required => true
    property :type, :required => true
    property :subject
    property :date_sent
    property :language
    property :date_received
    property :source
    property :topic_ids, :default => []
    property :tag_list
    property :regulation_list
    property :jurisdiction_list, :from => :jurisdictions
    property :action_taken
    property :request_type
    property :mark_registration_number
    property :works_attributes, :from => :works, with: lambda { |works| works.map { |work| ChillingEffects::Work.new(work.symbolize_keys) } }
    property :entity_notice_roles_attributes, :default => []
    property :file_uploads_attributes, :default => []
    property :id
    property :body

    # Response fields
    property :topics, :default => []
    property :sender_name
    property :recipient_name
    property :principal_name
    property :tags

    alias_method :files, :file_uploads_attributes
    alias_method :works, :works_attributes
    alias_method :roles, :entity_notice_roles_attributes
    alias_method :jurisdictions, :jurisdiction_list

    coerce_key :works_attributes, Array[ChillingEffects::Work]
    coerce_key :entity_notice_roles_attributes, Array[ChillingEffects::EntityNoticeRole]
    coerce_key :file_uploads_attributes, Array[ChillingEffects::FileUpload]

    validates_presence_of :title
    validates_inclusion_of :type, :in => TYPES

    validates_inclusion_of :language, :allow_nil => true, :in => LANGUAGES

    def submit
      unless valid?
        raise StandardError, "#{errors.messages.first[0]} #{errors.messages.first[1].first}"
      end
      ChillingEffects.post "/notices", json_for_submission
    end

    def json_for_submission
      notice = self.as_json.reject { |key, value| key == "topics" || value == [] }
      {:notice => notice, :authentication_token => ChillingEffects.token }.to_json
    end

    def topic_ids
      topics.map { |topic| topic.id }
    end

    def topic_ids=(ids)
      ids.each { |id| topics.push ChillingEffects::Topic.find(id) }
    end

    def sender_name=(name)
      roles.push ChillingEffects::EntityNoticeRole.new(
        :name => "sender", :entity_attributes => {
          :name => name
        }
      )
    end

    def recipient_name=(recipient)
      roles.push ChillingEffects::EntityNoticeRole.new(
        :name => "recipient", :entity_attributes => {
          :name => name
        }
      )
    end

    def principal_name=(recipient)
      roles.push ChillingEffects::EntityNoticeRole.new(
        :name => "principal", :entity_attributes => {
          :name => name
        }
      )
    end

    def self.find(id)
      response = ChillingEffects.get("/notices/#{id}.json")
      if response.success?
        hash = JSON.parse response.body
        self.new hash[hash.keys.first].symbolize_keys
      end
    end

  end
end
