module Turntables
# @author Simon Symeonidis
# A turntables repository. 
class Repository
  def initialize
    @sequential_dir = "seq"
    @monolithic_dir = "mono"
  end

  # @params location is the location of the sql repository for now (a directory
  #   for now).
  def register(location)
    @relative_dir = location
  end

  attr_accessor :sequential_dir
  attr_accessor :monolithic_dir
  attr_accessor :relative_dir
end
end

