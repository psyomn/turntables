require 'sqlite3'
require 'singleton'

module Turntables
# Database Registry pattern that connects to an sqlite 3 database.
# @author Simon Symeonidis
class DbRegistry
  include Singleton

  # Init with default db name
  # @param dbname is the name of the database is if it not specified
  # TODO we need to be able to set this somehow differently - applications
  # might require to name their database with their own specific name.
  def initialize(dbname="default.db")
    @handle = SQLite3::Database.new(dbname)
  end

  # Execute (any sort) of sql 
  # @return sql data
  def execute(*sql)
    @handle.execute(*sql)
  end

  # Check if a table exists in the database
  # @param name is the name of the table to check if exists
  # @return true if table exists, false if not
  def table_exists?(name)
    val = @database_handle.execute(@@exists_sql, "table", name) 
    1 == val.flatten[0]
  end

private 
  attr :handle

  @@exists_sql = "SELECT COUNT(type) from sqlite_master where type=? and name=?"
end
end

