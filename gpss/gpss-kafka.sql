psql postgres

create database kafkadb;

\c kafkadb;

create extension gpss;

CREATE TABLE student (
    id INT,
    name VARCHAR(100),
    address VARCHAR(200)
);
