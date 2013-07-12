require 'fileutils'

# lib
require 'turntables/transaction'
require 'turntables/db_registry'
require 'turntables/sql_modules/version_histories_sql'
require 'turntables/constants/repository_constants'

module Turntables
# @author Simon Symeonidis
# A turntables repository. 
class Repository
  include RepositoryConstants

  def initialize
    @transactions = Array.new
  end

  # @param location is the location of the sql repository for now (a directory
  #   for now).
  def register(location)
    @relative_dir = location
    @sequential_dir = "#{@relative_dir}/#{SeqDir}/*"
    @monolithic_dir = "#{@relative_dir}/#{MonoDir}/*"

    # Other init stuff here
    init_sequential_transactions 
  end

  # Function to call in order to make the database. 
  # 
  # TODO: Here, it should detect in what state the current database is in, and
  # go from there. In other words, whether it can skip sequential database
  # transactions by loading a monolithic one to exclude previous transactions.
  #
  # TODO: we need the version histories table, and
  # logic on what to actually execute over here
  def make!
    version = latest_version
    @transactions.each do |transaction| 
      DbRegistry.instance.execute_batch(transaction.data)
    end
  end

  attr_accessor :sequential_dir
  attr_accessor :monolithic_dir
  attr_accessor :relative_dir
  # Array<Turntables::Transaction>
  attr_accessor :sequential_transactions

private 

  # Get the latest database version from within the database
  # @return a Fixnum denoting the latest version retrieved from the database.
  #   A ':fresh' is returned if the database is entirely new.
  def latest_version
    DbRegistry.instance.table_exists? VersionHistorySql::TableName
  end

  # Create the version history table
  def create_version_history_table

  end

  # Find all the transactions that are to be processed sequentially
  def init_sequential_transactions
    sequential_files.each do |path| 
      data        = File.open(path).read
      filename    = path.split(/\//).last
      @transactions.push Transaction.new(data,filename)
    end
    nil
  end

  # Get the sequential transactional files
  def sequential_files; Dir[@sequential_dir] end
  # Get the monolithic transactional files
  def monolithic_files; Dir[@monolithic_dir] end

end
end

