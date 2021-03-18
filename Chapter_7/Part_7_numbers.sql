SELECT (37 * 59) / (78 - (8 * 6));

SELECT MOD(10,4);
SELECT MOD(22.75, 5);
SELECT POW(2,8);

SELECT ROUND(72.0909, 1), ROUND(72.0909, 2), ROUND(72.0909, 3);
SELECT TRUNCATE(72.0909, 1), TRUNCATE(72.0909, 2), TRUNCATE(72.0909, 3);
SELECT ROUND(17, -1), TRUNCATE(17, -1);


# Обработка данных со знаком
SELECT account_id, SIGN(avail_balance), ABS(avail_balance) FROM account;

# Временные данные
select utc_time();
SELECT @@global.time_zone, @@session.time_zone;
SET time_zone = 'Europe/Zurich';

UPDATE transaction SET txn_date = '2005-03-27 15:30:00' WHERE txn_id = 99999;
SELECT CAST('2005-03-27 15:30:00' AS DATETIME);

SELECT CAST('2005-03-27' AS DATE) date_field, CAST('108:17:57' AS TIME) time_field;

# Функции создания дат

update individual set birth_date = STR_TO_DATE('March 27, 2005', '%M %d, %Y')
WHERE cust_id = 9999;

# Работа с временными данными
SELECT DATE_ADD(CURRENT_DATE( ), INTERVAL 5 DAY);
UPDATE transaction
SET txn_date = DATE_ADD(txn_date, INTERVAL '3:27:11' HOUR_SECOND)
WHERE txn_id = 9999;
UPDATE employee
SET birth_date = DATE_ADD(birth_date, INTERVAL '911' YEAR_MONTH)
WHERE emp_id = 4789;
SELECT LAST_DAY('2005-03-25');

SELECT CURRENT_TIMESTAMP( ) current_est, CONVERT_TZ(CURRENT_TIMESTAMP( ), 'US/Eastern', 'UTC') current_utc

# Временные функции, возвращающие строки
SELECT DAYNAME('2005-03-22');
SELECT EXTRACT(YEAR FROM '2005-03-22 22:19:05');


# Временные функции, возвращающие числа
SELECT DATEDIFF('2005-09-05', '2005-06-22');
SELECT DATEDIFF('2005-06-22', '2005-09-05');


# Функции преобразования
SELECT CAST('1456328' AS SIGNED INTEGER);
SELECT CAST('999ABC111' AS UNSIGNED INTEGER);




