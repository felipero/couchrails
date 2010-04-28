require 'spec_helper'

describe "CRUD controls for post domains" do

  it "should be able to validate post" do
    post = Post.new
    post.valid?.should be == true
  end

end