SELECT account_id, cust_id FROM account;


SELECT cust_id FROM customer;

# Внешние соединения
SELECT a.account_id, c.cust_id
FROM account a INNER JOIN customer c
ON a.cust_id = c.cust_id;


SELECT a.account_id, b.cust_id, b.name
FROM account a INNER JOIN business b
ON a.cust_id = b.cust_id;


SELECT cust_id, name
FROM business;


SELECT a.account_id, a.cust_id, b.name
FROM account a LEFT OUTER JOIN business b
ON a.cust_id = b.cust_id;


SELECT c.cust_id, b.name
FROM customer c LEFT OUTER JOIN business b
ON c.cust_id = b.cust_id;


SELECT c.cust_id, b.name
FROM customer c RIGHT OUTER JOIN business b
ON c.cust_id = b.cust_id;


# Трехсторонние внешние соединения

SELECT a.account_id, a.product_cd,
CONCAT(i.fname, ' ', i.lname) person_name,
b.name business_name
FROM account a LEFT OUTER JOIN individual i
ON a.cust_id = i.cust_id
LEFT OUTER JOIN business b
ON a.cust_id = b.cust_id;


SELECT account_ind.account_id, account_ind.product_cd,
account_ind.person_name,
b.name business_name
FROM
(SELECT a.account_id, a.product_cd, a.cust_id,
CONCAT(i.fname, ' ', i.lname) person_name
FROM account a LEFT OUTER JOIN individual i
ON a.cust_id = i.cust_id) account_ind
LEFT OUTER JOIN business b
ON account_ind.cust_id = b.cust_id;


SELECT e.fname, e.lname,
e_mgr.fname mgr_fname, e_mgr.lname mgr_lname
FROM employee e INNER JOIN employee e_mgr
ON e.superior_emp_id = e_mgr.emp_id;

# Рекурсивные внешние соединения
SELECT e.fname, e.lname,
e_mgr.fname mgr_fname, e_mgr.lname mgr_lname
FROM employee e LEFT OUTER JOIN employee e_mgr
ON e.superior_emp_id = e_mgr.emp_id;

SELECT e.fname, e.lname,
e_mgr.fname mgr_fname, e_mgr.lname mgr_lname
FROM employee e RIGHT OUTER JOIN employee e_mgr
ON e.superior_emp_id = e_mgr.emp_id;


# Перекрестные соединения
SELECT pt.name, p.product_cd, p.name
FROM product p CROSS JOIN product_type pt;

SELECT 'Small Fry' name, 0 low_limit, 4999.99 high_limit
UNION ALL
SELECT 'Average Joes' name, 5000 low_limit, 9999.99 high_limit
UNION ALL
SELECT 'Heavy Hitters' name, 10000 low_limit, 9999999.99 high_limit;


# Естественные соединения
SELECT a.account_id, a.cust_id, c.cust_type_cd, c.fed_id
FROM account a NATURAL JOIN customer c;


SELECT a.account_id, a.cust_id, a.open_branch_id
FROM account a NATURAL JOIN branch b;