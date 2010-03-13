require 'spec_helper'

describe 'An active_model compliant CouchRails::ActiveModel' do

  before :each do
    @model = Models::Doc.new.to_model
  end

  it_should_behave_like 'an active_model compliant object'

  describe "persisted?" do
    it "should not be persisted when created" do
      @model.persisted?.should be_false
    end

    it "should be persisted after saved" do
      @model.save!
      @model.persisted?.should be_true
    end
  end

  describe "to_key" do
    it "should return nil as the key for new document" do
      @model.to_key.should be_nil
    end

    it "should return the _id as key for persisted document" do
      @model.save!
      @model.to_key.should == [@model["_id"]]
    end

    it "should allow user specify which field will be the key"
    it "should return the value of the specified key when object is persisted"
    it "should return nil when the oject is new, even when there is a field specified as the key"

  end

  describe "to_param" do
    it "should resolve to the first item of to_key result when the document is persisted" do
      @model.save!
      @model.to_param.should == @model.to_key.first.to_s
    end

    it "should resolve to nil when the document is new" do
      @model.to_param.should be_nil
    end
  end

end