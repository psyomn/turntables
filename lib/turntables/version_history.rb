# frozen_string_literal: true

require 'turntables/db_registry'
require 'turntables/sql_modules/version_history_sql'

module Turntables
  # @author Simon Symeonidis
  # This class is responsiblef for checking what version the current system is
  # that is using this library, and what is the maximum version available in the
  # repository. Naturally it follows that if in the repository the version is
  # greater than the one on the system currently, The updated must be triggered
  # to be done.
  # For now this is a halfly implemented active record, since this library is
  # lightweight and small (therefore not too many components are needed yet).
  class VersionHistory
    include VersionHistorySql

    # Create the version history object by giving version number and comment.
    # The date can be omitted, and it will be set to the current time of the
    # local system.
    # @param version is the version of the transaction that was performed
    # @param comment was any comments included in the sql file
    # @param date is the optional date, set to the local time if unspecified
    def initialize(version, comment, date = Time.now.to_i)
      @version = version
      @comment = comment
      @date    = date
    end

    # Check if the required database exists. Check to see if the database has
    # the version_histories table as well.
    def self.check
      if DbRegistry.instance.table_exists? TABLE_NAME
        VersionHistory.find_last
      else # db does not exist
        :fresh
      end
    end

    # Get all the stored version histories
    def self.find_all
      vhs = []
      DbRegistry.instance.execute(SELECT_ALL).each do |row|
        vhs.push VersionHistory.to_version_history(row)
      end
      vhs
    end

    # Find the last version history added by checking the max id
    # @return VersionHistory object or nil
    def self.find_last
      ret = DbRegistry.instance.execute(SELECT_LAST)
      VersionHistory.to_version_history(ret.first)
    end

    # Find a version history record by id
    # @return VersionHistory object or nil
    def self.find(id)
      ret = DbRegistry.instance.execute(SELECT_BY_ID, id)
      VersionHistory.to_version_history(ret.first)
    end

    # Insert a row into the table for version histories
    # @return insert result
    def self.insert(vhistory)
      DbRegistry.instance.execute(INSERT, vhistory.version,
                                  vhistory.date, vhistory.comment)
    end

    # Create the table of this model
    # @return nil
    def self.pull_up!
      DbRegistry.instance.execute(CREATE)
    end

    # Make an array representing the persisted object, into an object
    # in memory
    # @param record an array containing the elements to construct a
    #   version history
    # @return a VersionHistory object constructed from the records
    def self.to_version_history(record)
      vh = VersionHistory.new(record[1], record[2], record[3])
      vh.id = record[0]
      vh
    end

    attr_accessor :id
    attr_accessor :version
    attr_accessor :date
    attr_accessor :comment
  end
end
