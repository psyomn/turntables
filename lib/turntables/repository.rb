module Turntables
# @author Simon Symeonidis
# A turntables repository. 
class Repository
  def initialize
    @@seq  = "seq"
    @@mono = "mono"
  end

  # @params location is the location of the sql repository for now (a directory
  #   for now).
  def register(location)
    @relative_dir = location
    @sequential_dir = "#{@relative_dir}/#{@@seq}"
    @sequential_dir = "#{@relative_dir}/#{@@mono}"
  end

  attr_accessor :sequential_dir
  attr_accessor :monolithic_dir
  attr_accessor :relative_dir
end
end

