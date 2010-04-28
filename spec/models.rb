module Models
  class Doc < CouchRails::Document
    property :name
  end

  class DocWithKey < CouchRails::Document
    property :name
    
    use_key :name
  end

  class DocWithValidations < CouchRails::Document
    property :birth_year
    property :name

    validates_presence_of :name
    validates_length_of :name, :maximum => 10, :minimum => 2
    validates_format_of :birth_year, :with => /([0-9]+)/i, :allow_nil => true
  end

  class AssociatedDoc < CouchRails::Document
    property :name

    has_one :docWithAssociation
  end
  
  class DocWithAssociations < CouchRails::Document
    property :name
    belongs_to :associatedDoc
  end
end

