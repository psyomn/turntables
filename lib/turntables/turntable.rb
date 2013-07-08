require 'turntables/db_registry'
module Turntables
# @author 
class Turntable
  # Default constructor, that initializes some standard parameters
  # @param repository_location is the location where the repository is. The
  #   repository for now must be a directory containing the different sql files
  def initialize(repository_location)
    @revisions = Array.new
  end

  # Register a revision that needs to be processed later
  def register(revision)
    @revisions.push revision
  end

  # Create the tables by going through each revision
  def make!
  end

  attr_accessor :revisions
  attr_accessor :repository_location
end
end
