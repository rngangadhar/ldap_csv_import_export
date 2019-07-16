# frozen_string_literal: true

require File.expand_path('models/person', __dir__)

person = Person.new
person.import('sample_data/ldap_data.csv')
person.export('output_files/ldap_to_csv_output.csv', 'cn=Francesca*')
