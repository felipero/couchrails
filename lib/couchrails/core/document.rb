module CouchRails
  class Document < CouchRest::ExtendedDocument 
    extend CouchRails::Naming::ClassMethods
    include CouchRails::Naming::InstanceMethods
    include CouchRails::Validations

    def self.db(db_name = self.model_name.plural)
      self.use_database CouchRails::Config.db_for(db_name)
    end

    def self.inherited(subclass)
      subclass.key = "_id" unless subclass.key && !subclass.key.empty?
      super
    end

    def initialize
      self.class.db
    end

    def self.use_key(attr)
      self.key = attr
    end

  end
end