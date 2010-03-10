require "couchrest"

module CouchRails
  class Document < CouchRest::ExtendedDocument
    extend ActiveModel::Naming
    include ActiveModel::Conversion
    include ActiveModel::Validations
    include AbstractClass

    self.abstract_class = true

  end
end