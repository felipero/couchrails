require 'spec_helper'
  describe "Testing Validations through ActiveModel" do
    before :each do
      @model = Models::DocWithValidations.new
    end

    after :all do
      db = @model.database
      db.delete! if db
    end

    it "should not save a model with empty value for attribute defined in validate_presence_of" do
      @model.valid?.should be false
    end

    it "should be able to save model with attr field correctly" do
      @model.name= "NAME"
      @model.valid?.should be true
    end

    it "should not save with attribute more than 10 as defined in validate_length_of" do
      @model.name = "Name with more than 10 characters"
      @model.valid?.should be false
    end

    it "should not save model with less than 2 chars" do
      @model.name = "A"
      @model.valid?.should be false
    end

    it "should only allow numbers on age attr"  do
      @model.name = "NAME"
      @model.birth_year = "A"
      @model.valid?.should be false
    end
  end