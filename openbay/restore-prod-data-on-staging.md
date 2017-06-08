# Restore production data to staging database

```
ssh staging-app1
cd app/current
bundle exec rake db:backup:download:production
scp semi_hourly_postgres/databases/PostgreSQL.sql.gz 192.168.135.189:~/
rm -rf semi_hourly_postgres
exit

ssh staging-db1
gunzip PostgreSQL.sql.gz
sudo su postgres
pg_restore --verbose --clean --no-acl --no-owner -h 192.168.135.189 -U jr9wdvihf96v9a -d openbay_staging PostgreSQL.sql
<copy/paste password from playbooks/group_vars/staging.yml database_password>
exit
exit
```
