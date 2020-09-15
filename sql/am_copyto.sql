--
-- Test copying data from cstore_fdw tables.
--
CREATE FOREIGN TABLE test_contestant(handle TEXT, birthdate DATE, rating INT,
        percentile FLOAT, country CHAR(3), achievements TEXT[])
        SERVER cstore_server;

-- load table data from file
COPY test_contestant FROM '/Users/jefdavi/wd/cstore2/data/contestants.1.csv' WITH CSV;

-- export using COPY table TO ...
COPY test_contestant TO STDOUT;

-- export using COPY (SELECT * FROM table) TO ...
COPY (select * from test_contestant) TO STDOUT;

DROP FOREIGN TABLE test_contestant CASCADE;
