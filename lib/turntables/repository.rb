require 'fileutils'
require 'turntables/transaction'

module Turntables
# @author Simon Symeonidis
# A turntables repository. 
class Repository
  def initialize
    @@seq  = "seq/"
    @@mono = "mono/"
    @transactions = Array.new

    # Other init stuff here
    init_sequential_transactions 
  end

  # @params location is the location of the sql repository for now (a directory
  #   for now).
  def register(location)
    @relative_dir = location
    @sequential_dir = "#{@relative_dir}/#{@@seq}/*"
    @monolithic_dir = "#{@relative_dir}/#{@@mono}/*"
  end

  # Function to call in order to make the database. 
  # TODO: Here, it should detect in what state the current database is in, and
  # go from there. In other words, whether it can skip sequential database
  # transactions by loading a monolithic one to exclude previous transactions.
  def make!
  end

  attr_accessor :sequential_dir
  attr_accessor :monolithic_dir
  attr_accessor :relative_dir
  # Array<Turntables::Transaction>
  attr_accessor :sequential_transactions

private 

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

