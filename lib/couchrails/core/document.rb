module CouchRails
  class Document < CouchRest::ExtendedDocument
    extend CouchRails::ActiveModel::ClassMethods
    include CouchRails::ActiveModel::InstanceMethods

    use_database CouchRails::Config.db_for(self.model_name.plural)

  end
end