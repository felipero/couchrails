class Post < CouchRails::Document

    property :title
    property :content
    property :comments, :cast_as => 'Comment'

end
