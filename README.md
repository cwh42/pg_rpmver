# pg_rpmver
PostgreSQL extension to properly sort RPM version strings using rpmlib.

### Requirements
`zypper in postgresql-server-devel rpm-devel`

### Build
`make USE_PGXS=1`

### Install
`sudo make USE_PGXS=1 install`

### Enable
In psql:

`CREATE EXTENSION IF NOT EXISTS "rpmvercmp";`

### Use

    CREATE TABLE test_rpmver (
            version rpmver,
            release rpmver 
    );      
    
    INSERT INTO test_rpmver VALUES ('1.1.2', '3.3.4');
    INSERT INTO test_rpmver VALUES ('1.1.12', '0.1');
    INSERT INTO test_rpmver VALUES ('1.1.30', '0.1');
    INSERT INTO test_rpmver VALUES ('1.1.3', '0.1');
    INSERT INTO test_rpmver VALUES ('1.1.3', 'alpha');
    INSERT INTO test_rpmver VALUES ('1.1.30', '2');
    INSERT INTO test_rpmver VALUES ('1.1.30', '2.1');
    INSERT INTO test_rpmver VALUES ('1.1.30', '2.10');
    INSERT INTO test_rpmver VALUES ('1.1.30', '2.2');
    INSERT INTO test_rpmver VALUES ('1.2.3', '0.1');

#### What already works
    SELECT * FROM test_rpmver ORDER BY version USING <, release using <;
    SELECT * FROM test_rpmver WHERE version > '1.1.10';

#### What not yet works
    SELECT * FROM test_rpmver ORDER BY version ASC, release ASC;
