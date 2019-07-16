# Ldap Cli

Ldap::Cli is a Ruby util for reading/writing entries in an LDAP directory to/from CSV files. This tool creates entries in a directory under `ou=people,dc=example,dc=org` from a CSV file with the following attributes: `cn,sn,mail,uid`.

## Pre Requisites

Install OpenLDAP server.

```
sudo apt install slapd ldap-utils
```

Configure with following

```
sudo dpkg-reconfigure slapd
```

After configuring the slapd. Create a node called 'people'.

Create the following LDIF file and call it people_dn.ldif:

```
dn: ou=people,dc=example,dc=org
objectClass: organizationalUnit
ou: people
```

```ruby
  gem install 'ldap_cli'
```

- To change the LDAP connection configuration we have to update config/database.yml

 ```yml
	 development:
	  :host: 'localhost'
	  :port: 389
	  :auth:
	    :method: :simple
	    :username: 'admin'
	    :password: 'secret'

 ```
- To change ldap structure we have to update config/ldap.yml

```yml
	base:
	  'dc=example, dc=org'

	person:
	  dn: 'ou=people, dc=example, dc=org'
	  attrs:
	    - uid
	    - cn
	    - sn
	    - mail
``` 

## Usage

$ ruby demo.rb
    

There you can find a CSV file getting imported from 'sample_data/ldap_data.csv'.

## Features
- Create entries in an LDAP directory from a CSV file.
- Export entries returned from an LDAP search to a CSV file.

## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).
