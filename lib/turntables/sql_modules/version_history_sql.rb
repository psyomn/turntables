module Turntables
# @author Simon Symeonidis
# Some static information factored out to avoid class variables, and to 
# separate concerns.
module VersionHistorySql
  # Table name of this guy
  TableName  = "version_histories"

  # Table schema for the version history table.
  Create     = "CREATE TABLE #{TableName} ("\
    "id      INTEGER PRIMARY KEY AUTOINCREMENT, "\
    "version BIGINT, "\
    "date    BIGINT, "\
    "comment TEXT)"

  # Select last inserted transaction
  SelectLast = "SELECT * FROM #{TableName} "\
    " WHERE id=(SELECT MAX(id) FROM #{TableName});"
 
  # Sql to insert a version history into the table
  Insert     = "INSERT INTO #{TableName} (version,date,comment)"\
               " values (?,?,?)"
end
end
