# frozen_string_literal: true

require 'turntables/sql_modules/version_history_sql'

describe Turntables::VersionHistorySql do
  it 'should have a table name constant' do
    expect(subject.const_get('TABLE_NAME')).to_not be_empty
  end

  it 'should have a create sql constant' do
    expect(subject.const_get('CREATE')).to_not be_empty
  end

  it 'should have a select last sql constant' do
    expect(subject.const_get('SELECT_LAST')).to_not be_empty
  end

  it 'should have a select by id sql constant' do
    expect(subject.const_get('SELECT_BY_ID')).to_not be_empty
  end

  it 'should have a select all sql constant' do
    expect(subject.const_get('SELECT_ALL')).to_not be_empty
  end

  it 'should have an insert sql constant' do
    expect(subject.const_get('INSERT')).to_not be_empty
  end
end
