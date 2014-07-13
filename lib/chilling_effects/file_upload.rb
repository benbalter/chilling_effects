module ChillingEffects
  class FileUpload < Hashie::Dash

    include ActiveModel::Validations

    property :kind, :required => true
    property :file
    property :file_name

    KINDS = %w[original supporting]

    validates_inclusion_of :kind, :in => KINDS

  end
end
