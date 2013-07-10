require 'fileutils'
module Turntables
# @author Simon Symeonidis
# A turntables repository. 
class Repository
  def initialize
    @@seq  = "seq/"
    @@mono = "mono/"
  end

  # @params location is the location of the sql repository for now (a directory
  #   for now).
  def register(location)
    @relative_dir = location
    @sequential_dir = "#{@relative_dir}/#{@@seq}"
    @sequential_dir = "#{@relative_dir}/#{@@mono}"
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
end
end

