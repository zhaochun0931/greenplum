psql postgres


create database testdb;

\c testdb

create table t1 (id int);
insert into t1 SELECT generate_series(1,10);
select count(*) from t1;


select * from pg_class where relname = 't1';

SELECT attname, atttypid::regtype, attlen, attnotnull, atthasdef FROM pg_attribute 
WHERE attrelid = (SELECT oid FROM pg_class WHERE relname = 't1') 
AND attnum > 0;

SELECT column_name, data_type, character_maximum_length, is_nullable, column_default 
FROM information_schema.columns 
WHERE table_name = 't1';

SELECT indexname, indexdef 
FROM pg_indexes 
WHERE tablename = 't1';

SELECT conname, contype, conrelid::regclass AS table_name, confrelid::regclass AS referenced_table
FROM pg_constraint 
WHERE conrelid = 't1'::regclass;

SELECT relname, spcname 
FROM pg_class c 
JOIN pg_tablespace t ON c.reltablespace = t.oid 
WHERE relname = 't1';

SELECT pg_size_pretty(pg_total_relation_size('t1'));

SELECT pg_size_pretty(pg_relation_size('t1'));


SELECT relname, relfilenode FROM pg_class WHERE relnamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'public');


explain select * from t1 where id = 10;











PGOPTIONS='-c gp_session_role=utility' psql -h <hostname> -p <port> postgres
