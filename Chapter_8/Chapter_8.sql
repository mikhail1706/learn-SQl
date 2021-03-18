# Принципы группировки

SELECT open_emp_id FROM account;
SELECT open_emp_id FROM account GROUP BY open_emp_id;
SELECT open_emp_id, COUNT(*) how_many FROM account GROUP BY open_emp_id;
SELECT open_emp_id, COUNT(*) how_many FROM account GROUP BY open_emp_id HAVING COUNT(*) > 4;


# Агрегатные функции
SELECT MAX(avail_balance) max_balance, MIN(avail_balance) min_balance, AVG(avail_balance) avg_balance,
SUM(avail_balance) tot_balance, COUNT(*) num_accounts FROM account WHERE product_cd = 'CHK';


# Сравнение неявных и явных групп
SELECT product_cd, MAX(avail_balance) max_balance, MIN(avail_balance) min_balance, AVG(avail_balance) avg_balance,
SUM(avail_balance) tot_balance, COUNT(*) num_accounts FROM account GROUP BY product_cd;


# Подсчет уникальных значений
SELECT account_id, open_emp_id FROM account ORDER BY open_emp_id;
SELECT COUNT(open_emp_id) FROM account;
SELECT COUNT(DISTINCT open_emp_id) FROM account;


# Использование выражений
SELECT MAX(pending_balance - avail_balance) max_uncleared FROM account;


# Обработка значений Null
CREATE TABLE number_tbl (val SMALLINT);
INSERT INTO number_tbl VALUES (1);
INSERT INTO number_tbl VALUES (3);
INSERT INTO number_tbl VALUES (5);

SELECT COUNT(*) num_rows, COUNT(val) num_vals, SUM(val) total, MAX(val) max_val, AVG(val) avg_val
FROM number_tbl;

INSERT INTO number_tbl VALUES (NULL);
SELECT COUNT(*) num_rows, COUNT(val) num_vals, SUM(val) total, MAX(val) max_val, AVG(val) avg_val FROM number_tbl;



# Формирование групп


# Группировка по одному столбцу
SELECT product_cd, SUM(avail_balance) prod_balance  FROM account  GROUP BY product_cd;


# Группировка по нескольким столбцам
SELECT product_cd, open_branch_id, SUM(avail_balance) tot_balance FROM account GROUP BY product_cd, open_branch_id;


# Группировка посредством выражений
SELECT EXTRACT(YEAR FROM start_date) year, COUNT(*) how_many FROM employee GROUP BY EXTRACT(YEAR FROM start_date);


# Формирование обобщений
SELECT product_cd, open_branch_id, SUM(avail_balance) tot_balance FROM account GROUP BY product_cd, open_branch_id WITH ROLLUP;


# Условия групповой фильтрации
SELECT product_cd, SUM(avail_balance) prod_balance FROM account WHERE status = 'ACTIVE' GROUP BY product_cd HAVING SUM(avail_balance) >= 10000;

SELECT product_cd, SUM(avail_balance) prod_balance
FROM account
WHERE status = 'ACTIVE'
GROUP BY product_cd
HAVING MIN(avail_balance) >= 1000
AND MAX(avail_balance) <= 10000;


# Упражнения
# 8.1
SELECT COUNT(*) FROM account;

# 8.2
SELECT cust_id, COUNT(*) FROM account GROUP BY cust_id;

# 8.3
SELECT cust_id, COUNT(*) FROM account GROUP BY cust_id HAVING COUNT(*) >= 2;

# 8.4
SELECT product_cd, open_branch_id, SUM(avail_balance) FROM account GROUP BY product_cd, open_branch_id HAVING COUNT(*) > 1 ORDER BY 3 DESC;