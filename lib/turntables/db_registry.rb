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
  def execute(sql)
    @handle.execute(sql)
  end
end
end

