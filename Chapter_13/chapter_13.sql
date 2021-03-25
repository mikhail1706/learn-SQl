# Индексы
SELECT dept_id, name FROM department WHERE name LIKE 'A%';


# Создание индекса
ALTER TABLE department ADD INDEX dept_name_idx (name);

SHOW INDEX FROM department;

CREATE TABLE department
(dept_id SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
name VARCHAR(20) NOT NULL,
CONSTRAINT pk_department PRIMARY KEY (dept_id));

ALTER TABLE department DROP INDEX dept_name_idx;


# Уникальные индексы
ALTER TABLE department ADD UNIQUE dept_name_idx (name);

INSERT INTO department (dept_id, name) VALUES (999, 'Operations');


#Составные индексы
ALTER TABLE employee ADD INDEX emp_names_idx (lname, fname);

# Типы индексов
# Индексы на основе B-дерева
# Битовые индексы
# Текстовые индексы

# Использование индексов
SELECT emp_id, fname, lname FROM employee WHERE emp_id IN (1, 3, 9, 15, 22);

SELECT cust_id, SUM(avail_balance) tot_bal  FROM account  WHERE cust_id IN (1, 5, 9, 11)  GROUP BY cust_id;

EXPLAIN SELECT cust_id, SUM(avail_balance) tot_bal FROM account
WHERE cust_id IN (1, 5, 9, 11) GROUP BY cust_id;

ALTER TABLE account ADD INDEX acc_bal_idx (cust_id, avail_balance);

EXPLAIN SELECT cust_id, SUM(avail_balance) tot_bal FROM account WHERE cust_id IN (1, 5, 9, 11) GROUP BY cust_id\G;

# Обратная сторона индексации
# Ограничения
# Ограничения первичного ключа (Primary-key constraints)
# Ограничения внешнего ключа (Foreign-key constraints)
# Ограничения уникальности (Unique constraints)
# Проверочные ограничения целостности (Check constraints)

# Создание ограничений
CREATE TABLE product
(product_cd VARCHAR(10) NOT NULL,
    name VARCHAR(50) NOT NULL,
    product_type_cd VARCHAR (10) NOT NULL,
    date_offered DATE,
    date_retired DATE,
    CONSTRAINT fk_product_type_cd FOREIGN KEY (product_type_cd)
    REFERENCES product_type (product_type_cd),
    CONSTRAINT pk_product PRIMARY KEY (product_cd)
);

ALTER TABLE product
ADD CONSTRAINT pk_product PRIMARY KEY (product_cd);

ALTER TABLE product
ADD CONSTRAINT fk_product_type_cd FOREIGN KEY (product_type_cd)
REFERENCES product_type (product_type_cd);

ALTER TABLE product DROP PRIMARY KEY;
ALTER TABLE product
DROP FOREIGN KEY fk_product_type_cd;

# Ограничения и индексы


# Каскадные ограничения
SELECT product_type_cd, name FROM product_type;

SELECT product_type_cd, product_cd, name FROM product ORDER BY product_type_cd;

UPDATE product SET product_type_cd = 'XYZ' WHERE product_type_cd = 'LOAN';

UPDATE product_type SET product_type_cd = 'XYZ' WHERE product_type_cd = 'LOAN';

ALTER TABLE product DROP FOREIGN KEY fk_product_type_cd;

ALTER TABLE product ADD CONSTRAINT fk_product_type_cd FOREIGN KEY (product_type_cd)
    REFERENCES product_type (product_type_cd) ON UPDATE CASCADE;

UPDATE product_type SET product_type_cd = 'XYZ' WHERE product_type_cd = 'LOAN';

SELECT product_type_cd, name FROM product_type;

SELECT product_type_cd, product_cd, name FROM product ORDER BY product_type_cd;

ALTER TABLE product ADD CONSTRAINT fk_product_type_cd FOREIGN KEY (product_type_cd)
REFERENCES product_type (product_type_cd) ON UPDATE CASCADE ON DELETE CASCADE;