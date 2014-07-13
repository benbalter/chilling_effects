module ChillingEffects
  class Topic < Hashie::Dash
    include ActiveModel::Validations

    property :id, :required => true
    property :name, :required => true
    property :parent_id

    validates_numericality_of :parent_id, :allow_nil => true, :only_integer => true

    def self.find(id)
      ChillingEffects.topics.find { |topic| topic.id == id }
    end
  end
end
