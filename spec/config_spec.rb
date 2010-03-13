require 'spec_helper'

describe "CouchRails::Config" do

  before :each do
    @localhost = "127.0.0.1:5984"
    @cr = CouchRest.new(@localhost)
  end

  it "should create a db based on model_name the model is not on the map" do
    db = CouchRails::Config.db_for("modelos")
    db.should be_kind_of CouchRest::Database
    db.to_s.should == "#{@localhost}/modelos"
    @cr.databases.should include "modelos"
    dbs = CouchRails::Config.db_map
    dbs.should_not include :modelos
  end

  it "should use the provided name" do
    CouchRails::Config.db_map = {:modelos => :sampledb}
    db = CouchRails::Config.db_for("modelos")
    db.should be_kind_of CouchRest::Database
    db.to_s.should == "#{@localhost}/sampledb"
    @cr.databases.should include "sampledb"
    dbs = CouchRails::Config.db_map
    dbs.should include :modelos
  end

end