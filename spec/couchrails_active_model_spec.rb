require 'spec_helper'

describe 'An active_model compliant CouchRails::ActiveModel' do

  before :each do
    @model = ComplianceTest::CouchDocument.new.to_model
  end

  it_should_behave_like 'an active_model compliant object'

end