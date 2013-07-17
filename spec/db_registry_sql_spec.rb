require 'turntables/sql_modules/db_registry_sql'

include Turntables

describe DbRegistrySql do
  it "Should have a constant ExistsSql" do
    subject.const_get('ExistsSql').should_not be_empty
  end
end
