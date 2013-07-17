require 'fileutils'

# lib
require 'turntables/transaction'
require 'turntables/version_history'
require 'turntables/db_registry'
require 'turntables/sql_modules/version_history_sql'
require 'turntables/constants/repository_constants'

module Turntables
# @author Simon Symeonidis
# A turntables repository. This class is responsible for handling the
# versioning. This includes tasks such as checking database availability,
# and pulling up the version history table and modifying where needed (for
# example when completing a transaction, recording the date, the new version,
# and comments about said transaction).
class Repository
  include RepositoryConstants

  def initialize
    @transactions = Array.new
    @monolithics  = Array.new
  end

  # @param location is the location of the sql repository for now (a directory
  #   for now).
  def register(location)
    @relative_dir = location
    @sequential_dir = "#{@relative_dir}/#{SeqDir}/*"
    @monolithic_dir = "#{@relative_dir}/#{MonoDir}/*"

    # Initialize the transactions
    init_sequential_transactions!
    init_monolithic_transactions!
  end

  # Function to call in order to make the database. 
  # 
  # TODO: Here, it should detect in what state the current database is in, and
  # go from there. In other words, whether it can skip sequential database
  # transactions by loading a monolithic one to exclude previous transactions.
  def make!
    select_transactions!
    @transactions.each do |transaction| 
      vh = VersionHistory.new(transaction.version, transaction.comment)
      VersionHistory.insert(vh)
      DbRegistry.instance.execute_batch(transaction.data)
    end
  end

  attr_accessor :sequential_dir
  attr_accessor :monolithic_dir
  attr_accessor :relative_dir
  # Array<Turntables::Transaction>
  attr_accessor :transactions
  # Array<Turntables::Transaction>
  attr_accessor :monolithics

private 

  # Depending on what has been done before, we need to choose the proper 
  # transactions.
  # TODO: This probably can be done cleaner
  def select_transactions!
    check = VersionHistory.check
    if check == :fresh
      # Fresh db means, we create the version history table
      prepend_monolithic_transactions!
      VersionHistory.pull_up!
    else 
      last_version = VersionHistory.find_last.version
      @transactions.select!{|tr| tr.version > last_version}
    end
  end

  # This checks to see if any monolithic transactions exist, which can
  # eliminate previous sequential transactions.
  def prepend_monolithic_transactions!
    max = @monolithics.max_by &:version
    @transactions.select!{|tr| tr.version > max.version}
    @transactions = @transactions.unshift(max)
  end

  # Find all the transactions that are to be processed sequentially
  # @return nil
  def init_sequential_transactions!
    init_generic_transactions(sequential_files, @transactions)
  end

  # Find all the transactions that are to be processed only once
  # @return nil
  def init_monolithic_transactions!
    init_generic_transactions(monolithic_files, @monolithics)
  end

  # this is a generic transaction reader
  # return nil
  def init_generic_transactions(file_list, transaction_holder)
    file_list.each do |path|
      data        = File.open(path).read
      filename    = path.split(/\//).last
      transaction_holder.push Transaction.new(data,filename)
    end
    nil
  end

  # Get the sequential transactional files
  def sequential_files
    get_files_in_dir(@sequential_dir)
  end

  # Get the monolithic transactional files
  def monolithic_files
    get_files_in_dir(@monolithic_dir)
  end

  # Return the files that are in the given directory
  # @param path is the path to look for files in the directory
  # @return Array<String> of files sorted by stringnum_comparison predicate
  def get_files_in_dir(path)
    Dir[path].sort!{|e1,e2| stringnum_comparison(e1,e2)}
  end

  # Compare two strings with each other by extracting the digits
  def stringnum_comparison(a,b)
    extract_digits(a) <=> extract_digits(b)
  end

  # Extract the numbers from the string, and convert to Fixnum
  # @param string is the string to extract the numbers from
  # @return the number that was found in the string
  def extract_digits(string)
    string.gsub(/\D/,'').to_i
  end

end
end

