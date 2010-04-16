class Post < CouchRails::Document
  property :title
  property :content
  timestamp!
end
