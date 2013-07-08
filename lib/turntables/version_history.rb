require 'turntables/db_registry'
module Turntables
# @author Simon Symeonidis
# This class is responsiblef for checking what version the current system is
# that is using this library, and what is the maximum version available in the
# repository. Naturally it follows that if in the repository the version is 
# greater than the one on the system currently, The updated must be triggered
# to be done.
class VersionHistory

  def intialize
  end

  # Check if the required database exists. Check to see if the database has
  # the version_histories table as well.
  def check
  end

  # Table name of this guy
  @@table_name = :version_histories

  # Table schema for the version history table.
  @@version_history_sql = "CREATE TABLE #{@table_name} ("\
    "id INTEGER PRIMARY KEY AUTOINCREMENT, "\
    "version_number BIGINT, "\
    "comment TEXT)"
end
end

