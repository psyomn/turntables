module Turntables
# @author
#
class Transaction

  # Initialize this object with the contents of the sql file
  # @param sql_file_contents are the contents of the given sql file
  # @param filename is the filename of the given sql file. We use the filenames
  #   for the version that it is supposed to upgrade to.
  def initialize(sql_file_contents,filename)
    # Select only the lines that begin with '--$'
    @comment = sql_file_contents.lines.select{|e| e.match(/--\$/}.join
    @version = filename.to_i
    @data    = sql_file_contents
  end

  # The version should be obtained from the file name of the respective sql
  # file.
  attr_accessor :version
  
  # The comment should be parsed out from the respective sql file. We want to 
  # keep the comments in the sql file to keep things organized. We do not want
  # to alter the sql language to fit our needs. Therefore we just require the 
  # user to comment lines as '--$ my comment here' in order to parse them out
  # @example How to write comments that are to be parsed
  #   --$ author jon doe
  #   --$ This sql file will update the schema to version 1.2
  #   --$ You should note this and that
  #   -- This commen line would be ignored
  #
  #   CREATE TABLE accounts ( ... ) 
  attr_accessor :comment

  # The sql information to be passed on to the db registry 
  attr_accessor :data
end
end
