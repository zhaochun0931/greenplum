psql postgres


create database testdb;

\c testdb

create table t1 (id int);


insert into t1 SELECT generate_series(1,100);

select * from pg_class where relname = 't1';

SELECT attname, atttypid::regtype, attlen, attnotnull, atthasdef FROM pg_attribute 
WHERE attrelid = (SELECT oid FROM pg_class WHERE relname = 't1') 
AND attnum > 0;


explain select * from t1 where id = 10;











PGOPTIONS='-c gp_session_role=utility' psql -h <hostname> -p <port> postgres
