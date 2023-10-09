
stock=# INSERT INTO tbl_stock VALUES
stock-# (1,'Mouse',10,500,1 ),
stock-# (2,'Keyboard',5,450,3),
stock-# (3,'Modem',10,1200,2),
stock-# (4,'Memory',100,1500,5),
stock-# (5,'Headphone',50,750,4),
stock-# (6,'Memory',2,3500,4);
INSERT 0 6
Time: 12.890 ms
stock=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quality | int_price | fk_int_supplier
-----------------+-----------+-------------+-----------+-----------------
               1 | Mouse     |          10 |       500 |               1
               2 | Keyboard  |           5 |       450 |               3
               3 | Modem     |          10 |      1200 |               2
               4 | Memory    |         100 |      1500 |               5
               5 | Headphone |          50 |       750 |               4
               6 | Memory    |           2 |      3500 |               4
(6 rows)


Time: 10.961 ms

stock=# UPDATE tbl_stock
stock-# SET int_price = int_price + 1.5;
UPDATE 6
stock=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quality | int_price | fk_int_supplier
-----------------+-----------+-------------+-----------+-----------------
               1 | Mouse     |          10 |     501.5 |               1
               2 | Keyboard  |           5 |     451.5 |               3
               3 | Modem     |          10 |    1201.5 |               2
               4 | Memory    |         100 |    1501.5 |               5
               5 | Headphone |          50 |     751.5 |               4
               6 | Memory    |           2 |    3501.5 |               4
(6 rows)


stock=# select pk_int_stock_id,vchr_name,int_quality,int_price,fk_int_supplier FROM tbl_stock WHERE int_price > 1000;
 pk_int_stock_id | vchr_name | int_quality | int_price | fk_int_supplier
-----------------+-----------+-------------+-----------+-----------------
               3 | Modem     |          10 |    1201.5 |               2
               4 | Memory    |         100 |    1501.5 |               5
               6 | Memory    |           2 |    3501.5 |               4


stock=# SELECT * FROM tbl_stock
stock-# ORDER BY vchr_name ASC;
 pk_int_stock_id | vchr_name | int_quality | int_price | fk_int_supplier
-----------------+-----------+-------------+-----------+-----------------
               5 | Headphone |          50 |     751.5 |               4
               2 | Keyboard  |           5 |     451.5 |               3
               4 | Memory    |         100 |    1501.5 |               5
               6 | Memory    |           2 |    3501.5 |               4
               3 | Modem     |          10 |    1201.5 |               2
               1 | Mouse     |          10 |     501.5 |               1
(6 rows)


stock=# SELECT * FROM tbl_stock ORDER BY vchr_name ASC LIMIT 3  offset 3;
 pk_int_stock_id | vchr_name | int_quality | int_price | fk_int_supplier
-----------------+-----------+-------------+-----------+-----------------
               6 | Memory    |           2 |    3501.5 |               4
               3 | Modem     |          10 |    1201.5 |               2
               1 | Mouse     |          10 |     501.5 |               1
(3 rows)


Time: 11.226 ms


stock=# SELECT vchr_name,int_quality,int_price,(int_quality * int_price) AS extended_price FROM tbl_stock ;
 vchr_name | int_quality | int_price | extended_price
-----------+-------------+-----------+----------------
 Mouse     |          10 |     501.5 |           5015
 Keyboard  |           5 |     451.5 |         2257.5
 Modem     |          10 |    1201.5 |          12015
 Memory    |         100 |    1501.5 |         150150
 Headphone |          50 |     751.5 |          37575
 Memory    |           2 |    3501.5 |           7003
(6 rows)


Time: 11.764 ms 


stock=# DELETE FROM tbl_stock
stock-# WHERE fk_int_supplier = 5;
DELETE 1
stock=# select * from tbl_stock;
 pk_int_stock_id | vchr_name | int_quality | int_price | fk_int_supplier
-----------------+-----------+-------------+-----------+-----------------
               1 | Mouse     |          10 |     501.5 |               1
               2 | Keyboard  |           5 |     451.5 |               3
               3 | Modem     |          10 |    1201.5 |               2
               5 | Headphone |          50 |     751.5 |               4
               6 | Memory    |           2 |    3501.5 |               4
(5 rows)


stock=# INSERT INTO tble_dept VALUES
stock-# (1,'Computer Science','CS'),
stock-# (2,'Electronics','EC'),
stock-# (3,'Commerce','CC'),
stock-# (4,'Arts','AR');
INSERT 0 4
stock=# select * from tble_dept;
 pk_int_dept_id |  var_dept_name   | vchr_dept_description
----------------+------------------+-----------------------
              1 | Computer Science | CS
              2 | Electronics      | EC
              3 | Commerce         | CC
              4 | Arts             | AR
(4 rows)