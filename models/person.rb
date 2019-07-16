# frozen_string_literal: true

require 'ldap_cli'
require File.expand_path('base', __dir__)

# Class which reads/writes entries in an LDAP directory to/from CSV files
class Person < Base
  HEADERS = %w[cn sn mail uid].freeze

  attr_accessor :ldap

  def initialize
    @db_config = DATABASE_DETAILS[ENV]
    @ldap = Ldap::Cli.new(@db_config, HEADERS, CONFIG['person']['dn'])
  end

  def import(file_path)
    ldap.import(file_path)
  end

  def export(file_path, filter = nil)
    ldap.export(output_file_path: file_path, filter: filter)
  end
end
