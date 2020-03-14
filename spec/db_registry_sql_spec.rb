# frozen_string_literal: true

require 'turntables/sql_modules/db_registry_sql'

include Turntables

describe DbRegistrySql do
  it 'Should have a constant ExistsSql' do
    expect(subject.const_get('ExistsSql')).to_not be_empty
  end
end
