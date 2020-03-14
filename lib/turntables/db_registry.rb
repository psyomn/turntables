# frozen_string_literal: true

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
    def initialize(dbname = 'default.db')
      @name = dbname
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
      handle.execute(*sql)
    rescue StandardError => e
      print_exception e
    end

    # For special queries that may contain multiple statements. For example a
    # query that contains first a 'create table' query, and then some inserts to
    # poppulate that table. Ideally this should be used in order to create the
    # tables in sequence.
    # @param sql is the sql that contains multiple statements
    def execute_batch(sql)
      execute_batch(sql)
    rescue StandardError => e
      print_exception e
    end

    # Check if a table exists in the database
    # @param name is the name of the table to check if exists
    # @return true if table exists, false if not
    def table_exists?(name)
      val = handle.execute(EXISTS_SQL, 'table', name)
      val.flatten[0] == 1
    end

    # Close the current database.
    # @warn This is mainly here for the rspec testing, and should not be used
    #   unless you really know what you're doing.
    def close!
      @db_handle.close unless handle.closed?
    end

    # Open the database, with the name given previously
    # @warn This is mainly here for the rspec testing, and should not be used
    #   unless you really know what you're doing.
    def open!
      @db_handle = SQLite3::Database.new(@name) if handle.closed?
    end

    # The database name
    attr_accessor :name

    private

    # Other classes should not use the database handle directly
    attr :db_handle

    def handle
      @db_handle = SQLite3::Database.new(@name) if @handle.nil?
      @db_handle
    end

    def print_exception(exception)
      warn exception.message
      warn exception.backtrace
      warn 'Offending sql: '
      warn sql
    end
  end
end
