# Completely ditch Postgres

http://stackoverflow.com/questions/2748607/how-to-thoroughly-purge-and-reinstall-postgresql-on-ubuntu

First: If your install isn't already damaged, you can drop unwanted PostgreSQL servers ("clusters") in Ubuntu using pg_dropcluster. Use that in preference to a full purge and reinstall if you just want to start with a freshly initdb'd PostgreSQL instance.

If you really need to do a full purge and reinstall, first make sure PostgreSQL isn't running. ps -C postgres should show no results.

Now run:

apt-get --purge remove postgresql\*
to remove everything PostgreSQL from your system. Just purging the postgres package isn't enough since it's just an empty meta-package.

Once all PostgreSQL packages have been removed, run:

rm -r /etc/postgresql/
rm -r /etc/postgresql-common/
rm -r /var/lib/postgresql/
userdel -r postgres
groupdel postgres
You should now be able to:

apt-get install postgresql
or for a complete install:

apt-get install postgresql-8.4 postgresql-contrib-8.4 postgresql-doc-8.4

