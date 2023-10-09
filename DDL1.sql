Server [localhost]:
Database [postgres]:
Port [5432]:
Username [postgres]:
Password for user postgres:
psql (15.4)
WARNING: Console code page (437) differs from Windows code page (1252)
         8-bit characters might not work correctly. See psql reference
         page "Notes for Windows users" for details.
Type "help" for help.

postgres=# CREATE DATABASE stock ;
CREATE DATABASE
postgres=# \c stock;
You are now connected to database "stock" as user "postgres".
stock=# \l
                                                               List of databases
   Name    |  Owner   | Encoding |          Collate           |           Ctype            | ICU Locale | Locale Provider |   Access privileges
-----------+----------+----------+----------------------------+----------------------------+------------+-----------------+-----------------------
 billing   | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 postgres  | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 sample    | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 school    | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 staff     | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 stock     | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            |
 template0 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
           |          |          |                            |                            |            |                 | postgres=CTc/postgres
 template1 | postgres | UTF8     | English_United States.1252 | English_United States.1252 |            | libc            | =c/postgres          +
           |          |          |                            |                            |            |                 | postgres=CTc/postgres
(8 rows)

stock=# CREATE TABLE tbl_stock(
stock(#     pk_int_stock_id SERIAL PRIMARY KEY,
stock(#     vchr_name VARCHAR(100),
stock(#     int_Quality INT,
stock(#     int_price INT
stock(# );
CREATE TABLE
stock=# \d tbl_stock;
                                               Table "public.tbl_stock"
     Column      |          Type          | Collation | Nullable |                      Default
-----------------+------------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer                |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(100) |           |          |
 int_quality     | integer                |           |          |
 int_price       | integer                |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)


stock=# ALTER TABLE tbl_stock
stock-#       ALTER COLUMN int_price TYPE FLOAT;
ALTER TABLE
stock=# \d tbl_stock;
                                               Table "public.tbl_stock"
     Column      |          Type          | Collation | Nullable |                      Default
-----------------+------------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer                |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(100) |           |          |
 int_quality     | integer                |           |          |
 int_price       | double precision       |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)

stock=# CREATE TABLE tbl_supplier(
stock(#     pk_int_supplier_id SERIAL PRIMARY KEY,
stock(#     vchr_supplier_name VARCHAR(100)
stock(# );
CREATE TABLE
stock=# \d tbl_supplier;
                                                  Table "public.tbl_supplier"
       Column       |          Type          | Collation | Nullable |                         Default
--------------------+------------------------+-----------+----------+----------------------------------------------------------
 pk_int_supplier_id | integer                |           | not null | nextval('tbl_supplier_pk_int_supplier_id_seq'::regclass)
 vchr_supplier_name | character varying(100) |           |          |
Indexes:
    "tbl_supplier_pkey" PRIMARY KEY, btree (pk_int_supplier_id)

stock=# ALTER TABLE tbl_stock
stock-# ADD COLUMN fk_int_supplier INT;
ALTER TABLE
stock=# ALTER TABLE tbl_stock
stock-# ADD CONSTRAINT fk_int_supplier
stock-# FOREIGN KEY(fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id)
stock-# ON DELETE CASCADE ON UPDATE CASCADE
stock-# ;
ALTER TABLE
stock=# \d tbl_stock
                                               Table "public.tbl_stock"
     Column      |          Type          | Collation | Nullable |                      Default
-----------------+------------------------+-----------+----------+----------------------------------------------------
 pk_int_stock_id | integer                |           | not null | nextval('tbl_stock_pk_int_stock_id_seq'::regclass)
 vchr_name       | character varying(100) |           |          |
 int_quality     | integer                |           |          |
 int_price       | double precision       |           |          |
 fk_int_supplier | integer                |           |          |
Indexes:
    "tbl_stock_pkey" PRIMARY KEY, btree (pk_int_stock_id)
Foreign-key constraints:
    "fk_int_supplier" FOREIGN KEY (fk_int_supplier) REFERENCES tbl_supplier(pk_int_supplier_id) ON UPDATE CASCADE ON D

stock=# CREATE TABLE tble_dept(
stock(#      pk_int_dept_id SERIAL PRIMARY KEY,
stock(#      var_dept_name VARCHAR(25)
stock(# );
CREATE TABLE
stock=# \d tble_dept
                                             Table "public.tble_dept"
     Column     |         Type          | Collation | Nullable |                      Default
----------------+-----------------------+-----------+----------+---------------------------------------------------
 pk_int_dept_id | integer               |           | not null | nextval('tble_dept_pk_int_dept_id_seq'::regclass)
 var_dept_name  | character varying(25) |           |          |
Indexes:
    "tble_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)
Referenced by:
    TABLE "tbl_classes" CONSTRAINT "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tble_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE

stock=#  CREATE TABLE tbl_classes(
stock(#     pk_int_class_id SERIAL PRIMARY KEY,
stock(#     vchr_class_name VARCHAR(25),
stock(#     fk_int_dept_id INT,
stock(#     FOREIGN KEY(fk_int_dept_id) REFERENCES tble_dept(pk_int_dept_id)
stock(#     ON DELETE CASCADE ON UPDATE CASCADE
stock(# );
CREATE TABLE

stock=# \d tbl_classes
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(25) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tble_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE

stock=# CREATE TABLE tbl_enrollment (
stock(#     pk_int_enrollment_id SERIAL PRIMARY KEY,
stock(#     int_count INT,
stock(#     fk_int_class_id INT,
stock(#     FOREIGN KEY(fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id)
stock(#     ON DELETE CASCADE ON UPDATE CASCADE
stock(# );
CREATE TABLE
stock=# \d tbl_enrollment
                                            Table "public.tbl_enrollment"
        Column        |  Type   | Collation | Nullable |                           Default
----------------------+---------+-----------+----------+--------------------------------------------------------------
 pk_int_enrollment_id | integer |           | not null | nextval('tbl_enrollment_pk_int_enrollment_id_seq'::regclass)
 int_count            | integer |           |          |
 fk_int_class_id      | integer |           |          |
Indexes:
    "tbl_enrollment_pkey" PRIMARY KEY, btree (pk_int_enrollment_id)
Foreign-key constraints:
    "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE    


stock=# ALTER TABLE tbl_classes
stock-# ADD UNIQUE (vchr_class_name);
ALTER TABLE
Time: 14.118 ms
stock=# \d tbl_classes
                                              Table "public.tbl_classes"
     Column      |         Type          | Collation | Nullable |                       Default
-----------------+-----------------------+-----------+----------+------------------------------------------------------
 pk_int_class_id | integer               |           | not null | nextval('tbl_classes_pk_int_class_id_seq'::regclass)
 vchr_class_name | character varying(25) |           |          |
 fk_int_dept_id  | integer               |           |          |
Indexes:
    "tbl_classes_pkey" PRIMARY KEY, btree (pk_int_class_id)
    "tbl_classes_vchr_class_name_key" UNIQUE CONSTRAINT, btree (vchr_class_name)
Foreign-key constraints:
    "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tble_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE
Referenced by:
    TABLE "tbl_enrollment" CONSTRAINT "tbl_enrollment_fk_int_class_id_fkey" FOREIGN KEY (fk_int_class_id) REFERENCES tbl_classes(pk_int_class_id) ON UPDATE CASCADE ON DELETE CASCADE  

stock=# ALTER TABLE tble_dept
stock-#  ADD COLUMN vchr_dept_description VARCHAR(25);
ALTER TABLE
Time: 10.045 ms
stock=# \d tble_dept
                                                 Table "public.tble_dept"
        Column         |         Type          | Collation | Nullable |                      Default
-----------------------+-----------------------+-----------+----------+---------------------------------------------------
 pk_int_dept_id        | integer               |           | not null | nextval('tble_dept_pk_int_dept_id_seq'::regclass)
 var_dept_name         | character varying(25) |           |          |
 vchr_dept_description | character varying(25) |           |          |
Indexes:
    "tble_dept_pkey" PRIMARY KEY, btree (pk_int_dept_id)
Referenced by:
    TABLE "tbl_classes" CONSTRAINT "tbl_classes_fk_int_dept_id_fkey" FOREIGN KEY (fk_int_dept_id) REFERENCES tble_dept(pk_int_dept_id) ON UPDATE CASCADE ON DELETE CASCADE

stock=# INSERT INTO tbl_supplier VALUES
stock-# (1,'Logitech'),
stock-# (2,'Samsung'),
stock-# (3,'Iball'),
stock-# (4,'LG'),
stock-# (5,'Creative');
INSERT 0 5
Time: 2.748 ms
stock=# \dt tbl_supplier
            List of relations
 Schema |     Name     | Type  |  Owner
--------+--------------+-------+----------
 public | tbl_supplier | table | postgres
(1 row)


stock=# select * from tbl_supplier
stock-# ;
 pk_int_supplier_id | vchr_supplier_name
--------------------+--------------------
                  1 | Logitech
                  2 | Samsung
                  3 | Iball
                  4 | LG
                  5 | Creative
(5 rows)


Time: 10.695 ms
stock=# 