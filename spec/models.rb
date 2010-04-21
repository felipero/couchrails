module Models
  class Doc < CouchRails::Document
    property :name
  end

  class DocWithKey < CouchRails::Document
    property :name
    
    use_key :name
  end

  class DocWithValidations < CouchRails::Document
    property :name
    validates_presence_of :name
  end
end

