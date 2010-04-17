class Post < CouchRails::Document

    property :title
    property :content
    property :Comments, :cast_as => 'Comment'

    timestamps!
end
