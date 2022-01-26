#!/bin/bash

/etc/init.d/apacheds-2.0.0.AM25-default start
/etc/init.d/xinetd start

sleep 10

export ADMIN_PASSWORD='secret'

ldapmodify -c -a -f /ldifs/seed.ldif -h localhost -p 10389 -D "uid=admin,ou=system" -w 'secret'

enable_replication
setup_replication


/etc/init.d/apacheds-2.0.0.AM25-default stop
/etc/init.d/apacheds-2.0.0.AM25-default console
