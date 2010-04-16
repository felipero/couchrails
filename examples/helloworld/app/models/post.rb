class Post < CouchRails::Document

  view_by :title
  property :title
  property :content
end
