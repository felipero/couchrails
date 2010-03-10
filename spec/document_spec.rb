require File.dirname(__FILE__) + '/spec_helper'

describe CouchRails::Document do
  describe "to be compliant with ActiveModel" do

    before(:each) do
      @model = CouchRails::Document.new
    end

    it "should responde to model_name" do
        @model.class.should respond_to(:model_name)
        name = @model.class.model_name
#        name should be_an_instance_of String
        name.human.should be_an_instance_of String
        name.partial_path.should be_an_instance_of String
        name.singular.should be_an_instance_of String
        name.plural.should be_an_instance_of String
    end
  end
end