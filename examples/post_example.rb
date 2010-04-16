require 'couchrails'

class Post < CouchRails::Document
	property :title
	property :content

end


puts "Starting demonstration"

post = Post.new()
post.title = "Demo Post"
post.content =  "This is just an example of using CouchRails. Still under development... stay put"

puts "Saved!" if post.save!

puts "Please check your couchDB installation, you might found on record"

puts "bye!"
