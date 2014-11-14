module ChillingEffects
  class Entity < Hashie::Dash

    include ActiveModel::Validations

    property :name, :required => true
    property :kind
    property :address_line_1
    property :address_line_2
    property :city
    property :state
    property :zip
    property :country_code
    property :phone
    property :email
    property :url

    KINDS = %w[organization individual]

    validates_inclusion_of :kind, :in => KINDS
    validates_length_of :country_code, :is => 2, :allow_nil => true
    validates_presence_of :name

  end
end
