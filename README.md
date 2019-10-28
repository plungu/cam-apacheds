# cam-apacheds

This project run ApacheDS in a docker container with an OpenJDK 11 environment.

[ApacheDS Homepage](http://directory.apache.org/apacheds/)

* ou=people,ou=example,ou=com
    * ou=jane,ou=people,ou=example,ou=com (Password: jane)
    * ou=john,ou=people,ou=example,ou=com (Password: john)
    * ou=joe,ou=people,ou=example,ou=com (Password: joe)
    * ou=judy,ou=people,ou=example,ou=com (Password: judy)
* ou=groups,ou=example,ou=com
    * ou=camunda-users,ou=people,ou=example,ou=com 
    * ou=all-users,ou=people,ou=example,ou=com 

## How to use this image
Currently this image does not take any environment variables but you need to expose ports to your local machine to connect using [Apache Directory Studio](http://directory.apache.org/studio/)

* `-p 10389:10389`  (unencrypted or StartTLS)
* `-p 10636:10636`  (SSL) - not tested

`docker run -d -p 10389:10389 --name apacheds kuchenmn/cam-apacheds`
or
`docker run -d -p 10389:10389 -p 10636:10636 --name apacheds kuchenmn/cam-apacheds` - not tested

## Connect with Apache Directory Studio

1. Start Apache Directory Studio
2. In the bottom left corner there is a section called "Connections" Click on the "New Connection..." icon to add a connection to your container.
3. Hostname: `0.0.0.0` and Port: `10389`
4. Click "Next"
5. Bind DN or user: `uid=admin,ou=system` Bind password: `secret` (Default ApacheDS password)
6. Click "Finish"
