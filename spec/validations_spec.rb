require 'spec_helper'
  describe "Testing Validations through ActiveModel" do
    before :each do
      @model = Models::Doc.new
    end

    after :all do
      db = @model.database
      db.delete! if db
    end

    it "should not allow saving a model registered with validations" do
      @model = Models::DocWithValidations.new
      @model.valid?.should be false
    end
  end