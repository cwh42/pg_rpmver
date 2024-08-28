### Requirements
`zypper in postgresql-server-devel rpm-devel`

### Build
`make USE_PGXS=1`

### Install
`sudo make USE_PGXS=1 install`

### Enable
In psql:
`CREATE EXTENSION IF NOT EXISTS "rpmvercmp"`

### Use

    CREATE TABLE test_rpmver (
            version rpmver,
            release rpmver 
    );      
    
    INSERT INTO test_rpmver VALUES ('1.1.2', '3.3.4');
    INSERT INTO test_rpmver VALUES ('1.1.12', '0.1');
       
    SELECT * FROM test_rpmver ORDER BY version ASC;
