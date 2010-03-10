require "couchrest"

module CouchRails
  class Document < CouchRest::ExtendedDocument
    include ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations
    
  end
end