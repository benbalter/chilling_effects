module ChillingEffects
  class EntityNoticeRole < Hashie::Dash

    include ActiveModel::Validations
    include Hashie::Extensions::Coercion

    NAMES = %w[
      principal
      agent
      recipient
      sender
      target
      issuing_court
      plaintiff
      defendant
    ]

    property :name, :required => true
    property :entity_id
    property :entity_attributes

    coerce_key :entity_attributes, ChillingEffects::Entity

    alias_method :entity, :entity_attributes

    validates_numericality_of :entity_id, :allow_nil => true, :only_integer => true
    validates_inclusion_of :name, :in => NAMES

  end
end
