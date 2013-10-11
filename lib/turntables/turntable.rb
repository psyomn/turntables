require 'turntables/db_registry'
require 'turntables/repository'
require 'turntables/turntable_exception'

module Turntables
# @author Simon Symeonidis
# The facade controller to the rest of this library.
class Turntable
  # Default constructor, that initializes some standard parameters
  def initialize
    @revisions = Array.new
    @repository = Repository.new
  end

  # Register a revision that needs to be processed later
  # @param repository_root_path is the root path to all the sql.
  def register(repository_root_path)
    @repository.register(repository_root_path)
  end

  # Make the repository at a specific location instead of default.
  def make_at!(location)
    DbRegistry.instance.close!
    DbRegistry.instance.name = location
    DbRegistry.instance.open!
    make!
  end 

  # Create the tables by going through each revision
  def make!
    if @repository.malformed?
      raise TurntableException, 
        "The directory structure at #{@repository.relative_dir} is malformed."
    else
      @repository.make!
    end
  end

  attr_accessor :repository
end
end
