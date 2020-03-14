# frozen_string_literal: true

require 'turntables/sql_modules/version_history_sql'

include Turntables

describe VersionHistorySql do
  it 'should have a table name constant' do
    expect(subject.const_get('TableName')).to_not be_empty
  end

  it 'should have a create sql constant' do
    expect(subject.const_get('Create')).to_not be_empty
  end

  it 'should have a select last sql constant' do
    expect(subject.const_get('SelectLast')).to_not be_empty
  end

  it 'should have a select by id sql constant' do
    expect(subject.const_get('SelectById')).to_not be_empty
  end

  it 'should have a select all sql constant' do
    expect(subject.const_get('SelectAll')).to_not be_empty
  end

  it 'should have an insert sql constant' do
    expect(subject.const_get('Insert')).to_not be_empty
  end
end
