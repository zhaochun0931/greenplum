psql postgres


create database testdb;

\c testdb

create table t1 (id int);


insert into t1 SELECT generate_series(1,100);



explain select * from t1 where id = 10;











PGOPTIONS='-c gp_session_role=utility' psql -h <hostname> -p <port> postgres
