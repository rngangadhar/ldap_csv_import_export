# frozen_string_literal: true

require 'yaml'

class Base
  ENV = 'development'
  DATABASE_DETAILS = YAML.safe_load(File.read('config/database.yml'), [Symbol])
  CONFIG = YAML.safe_load(File.read('config/ldap.yml'), [Symbol])
end
