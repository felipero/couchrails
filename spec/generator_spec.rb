require 'spec_helper'
require 'lib/generators/couchrails'

describe "Generator integration" do

	def create_generator(name, type)	
		return  Rails::Generators::GeneratedAttribute.new(name, type )
	end

	it "should be able to return cast_as declaration from non default attribute" do
		generator = create_generator("comment", "Comment")
		generator.declaration.should be == "comment, :cast_as => 'Comment'"
	end

	it "should cast any type that doesn't have default" do
		generator = create_generator("aaaaa", "AAAA")
		generator.declaration.should be == "aaaaa, :cast_as => 'AAAA'"

	end
	
	it "should return default values for common primitive types" do
		generator = create_generator("name", "string")
		generator.declaration.should be == "name"
	end

end
