require 'sqlite3'
require 'singleton'

require 'turntables/sql_modules/db_registry_sql'

module Turntables
# Database Registry pattern that connects to an sqlite 3 database.
# @author Simon Symeonidis
class DbRegistry
  include Singleton
  include DbRegistrySql

  # Init with default db name
  # @param dbname is the name of the database is if it not specified
  # TODO we need to be able to set this somehow differently - applications
  # might require to name their database with their own specific name.
  def initialize(dbname="default.db")
    @handle = SQLite3::Database.new(dbname)
  end

  # Execute (any sort) of sql 
  # @param sql is the multiple arguments of the function to execute. Usually
  #   you should give it first the sql you want that is to be prepared. Then
  #   you specify the variables to be set in the query, in the right order.
  # @example Simple usage
  #   sql = "INSERT INTO person (name, surname) values (?,?)"
  #   DbRegistry.instance.execute(sql,"jon","doe")
  # @return sql data
  def execute(*sql)
    @handle.execute(*sql)
  end

  # For special queries that may contain multiple statements. For example a 
  # query that contains first a 'create table' query, and then some inserts to
  # poppulate that table. Ideally this should be used in order to create the
  # tables in sequence.
  # @param sql is the sql that contains multiple statements
  def execute_batch(sql)
    @handle.execute_batch(sql)
  end

  # Check if a table exists in the database
  # @param name is the name of the table to check if exists
  # @return true if table exists, false if not
  def table_exists?(name)
    val = @database_handle.execute(ExistsSql, "table", name) 
    1 == val.flatten[0]
  end

private 
  attr :handle

end
end

