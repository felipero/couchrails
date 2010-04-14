require 'spec_helper'

describe 'An active_model compliant CouchRails::ActiveModel' do

  before :each do
    @model = Models::Doc.new
  end

  after :all do
    db = @model.database
    db.delete! if db
  end

  it_should_behave_like 'an active_model compliant object'

  describe "persisted?" do
    it "should be persisted after saved" do
      @model.save!
      @model.persisted?.should be_true
    end

    it "should not be persisted when created" do
      @model.persisted?.should be_false
    end
  end

  describe "to_key" do
    it "should return the _id as key for persisted document" do
      @model.save!
      @model.to_key.should == [@model["_id"]]
    end

    it "should return nil as the key for new document" do
      @model.to_key.should be_nil
    end

    it "should allow user specify which field will be the key" do
      @model = Models::DocWithKey.new
      @model.name = 'felipe'
      @model.save!
      @model.to_key.should == ['felipe']
      @model.to_param.should == 'felipe'
    end

    it "should return nil when the object is new, even when there is a field specified as the key" do
      @model.save!
      @model["_id"] = nil
      @model.to_key.should == [nil]
    end

  end

  describe "to_param" do
    it "should resolve to the first item of to_key result when the document is persisted" do
      @model.to_param.should be nil
      @model.save!
      @model.to_param.should == @model.to_key.first.to_s
    end

    it "should resolve to nil when the document is new" do
      @model.to_param.should be_nil
    end
  end

  describe "initialization" do
    it "should set a database with a default name on the initialization" do
      @model.database.name.should == 'models_docs'
    end

    it "should initialize a model with the correct db name from config" do
      CouchRails::Config.db_map = {:models_docs => :documents}
      @model = Models::Doc.new
      @model.database.name.should == 'documents'
    end
  end

end