require 'couch_rails'

class Post < CouchRails::Document
	property :title
	property :content

end


puts "Starting demonstration"

post = Post.new()
post.title = "Demo Post"
post.content =  "This is just an example of using CouchRails. Still under development... stay put"

puts "Saved!" if post.save!

post_recovered = Post.find(post.id) # Post.get(post.id)

puts "Take a look at how it comes back from the DB"
puts post_recovered

puts "Let's list all posts on the DB"
posts = Post.all
puts posts

puts "Please check your couchDB installation, you might find one record"

puts "bye!"
