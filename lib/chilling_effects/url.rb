module ChillingEffects
  class Url < Hashie::Dash
    include ActiveModel::Validations

    property :url, :required => true
    validates_url :url
    
  end
end
