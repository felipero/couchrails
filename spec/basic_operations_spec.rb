require "spec_helper"

describe "CouchRails queries" do

  before :each do
    @model = Models::Doc.new
    @model.name = "model_#{rand(999)}"
    @model.save
  end

  after :each do
    # Need to make tests independent of each other
    # Should do that by reseting the database but then it will break the default view all
    # that is stored in some cache by couchrest.
    # Alternative is remove each doc on DB by hand. :P
    Models::Doc.all.each {|m| m.destroy }
  end

  after :all do
    db = @model.database
    db.delete! if db
  end

  it "should get an object by its id" do
    obj = Models::Doc.get(@model.id)
    obj.name.should == @model.name
  end

  it "should find an object by its id" do
    obj = Models::Doc.find(@model.id)
    obj.name.should == @model.name
  end

  it "should find only objects of the same type" do
    m = Models::Doc.new
    m.name = "model_#{rand(999)}"
    m.save

    mk = Models::DocWithKey.new
    mk.name = "model_with_key_#{rand(999)}"
    mk.save

    objs = Models::Doc.all
    objs.should be_an Array
    objs.size.should be 2
    objs.should include m
    objs.should_not include mk
  end

  it "should find all objects" do
    m = Models::Doc.new
    m.name = "model_#{rand(999)}"
    m.save

    objs = Models::Doc.all
    objs.should be_an Array
    objs.size.should be 2
    objs.should include(@model)
    objs.should include m
  end

end