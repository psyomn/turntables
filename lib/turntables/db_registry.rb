require 'sqlite3'

module Turntables
# Database Registry pattern that connects to an sqlite 3 database.
# @author Simon Symeonidis
class DbRegistry
  def initialize(dbname="default.db")
    @handle = Database::SQLite3.new(dbname)
  end
  def execute(sql)
    @handle.execute(sql)
  end
end
end

