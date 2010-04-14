module Models
  class Doc < CouchRails::Document
    property :name
  end

  class DocWithKey < CouchRails::Document
    property :name
    
    use_key :name
  end
end