require 'turntables/sql_modules/version_history_sql'

include Turntables

describe VersionHistorySql do

  it "should have a table name constant" do
    subject.const_get('TableName').should_not be_empty
  end

  it "should have a create sql constant" do
    subject.const_get('Create').should_not be_empty
  end

  it "should have a select last sql constant" do
    subject.const_get('SelectLast').should_not be_empty
  end 

  it "should have a select by id sql constant" do
    subject.const_get('SelectById').should_not be_empty
  end

  it "should have a select all sql constant" do
    subject.const_get('SelectAll').should_not be_empty
  end

  it "should have an insert sql constant" do
    subject.const_get('Insert').should_not be_empty
  end
end

