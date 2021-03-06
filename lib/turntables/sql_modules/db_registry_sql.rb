# frozen_string_literal: true

module Turntables
  # @author Simon Symeonidis
  # The sql for the db registry.
  module DbRegistrySql
    EXISTS_SQL = 'SELECT COUNT(type) from sqlite_master where type=? and name=?'
  end
end
