# Database setup

## SQLite3

To use SQLite3, first run the following command:
```
sqlite3 links < factorial.sql
```
This will create a database file called `links`.  It will also result in a `SQLite3` prompt.  

Next, copy the config file `config.sqlite3` to `config` and run Links using the command `linx --config=config factorial.links`.  This should result in a running Web program that performs queries against the SQLite3 database `links`.


## PostgreSQL

To use PostgreSQL with this example, first ensure Postgres itself is configured with a database called `links` and a user account for user `links`.  Copy the `config.pgsql` config file to `config` and edit it to use the correct username and password.  Using a different username or database name is possible but requires editing the username in the config file or the database name in the source code.

Once configuration is done, run the `factorials.sql` file using `psql -f factorials.sql` plus whatever username and database parameters are needed to connect to the `links` database as the `links` user, for example, `psql -d links -U links -f factorials.sql` followed by the appropriate password.  Then running `linx --config=config factorials.links` should work.


## MySQL, MariaDB

MySQL and MariaDB should be supported through the OPAM `mysql` library.  Links support for `mysql` will be reinstated soon.
