# frozen_string_literal: true

require 'turntables/sql_modules/db_registry_sql'

describe Turntables::DbRegistrySql do
  it 'Should have a constant ExistsSql' do
    expect(subject.const_get('EXISTS_SQL')).to_not be_empty
  end
end
