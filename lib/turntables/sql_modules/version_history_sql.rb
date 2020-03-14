# frozen_string_literal: true

module Turntables
  # @author Simon Symeonidis
  # Some static information factored out to avoid class variables, and to
  # separate concerns.
  module VersionHistorySql
    # Table name of this guy
    TABLE_NAME = 'version_histories'

    # Table schema for the version history table.
    CREATE = "CREATE TABLE #{TABLE_NAME} ("\
      'id      INTEGER PRIMARY KEY AUTOINCREMENT, '\
      'version BIGINT, '\
      'date    BIGINT, '\
      'comment TEXT)'

    # Select last inserted transaction
    SELECT_LAST = "SELECT * FROM #{TABLE_NAME} "\
      " WHERE id=(SELECT MAX(id) FROM #{TABLE_NAME});"

    # Select a record by id
    SELECT_BY_ID = "SELECT * FROM #{TABLE_NAME} WHERE id=?"

    # Select all the records
    SELECT_ALL = "SELECT * FROM #{TABLE_NAME}"

    # Sql to insert a version history into the table
    INSERT = "INSERT INTO #{TABLE_NAME} (version,date,comment)"\
             ' values (?,?,?)'
  end
end
