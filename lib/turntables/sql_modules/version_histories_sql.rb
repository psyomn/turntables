module Turntables
# @author Simon Symeonidis
# Some static information factored out to avoid class variables, and to 
# separate concerns.
module VersionHistorySql
  # Table name of this guy
  TableName = :version_histories

  # Table schema for the version history table.
  CreateSql = "CREATE TABLE #{TableName} ("\
    "id      INTEGER PRIMARY KEY AUTOINCREMENT, "\
    "version BIGINT, "\
    "date    BIGINT, "\
    "comment TEXT)"
end
end
