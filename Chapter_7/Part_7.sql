# Создание, преобразование и работа с данными

insert into string_tbl (char_fld, vchar_fld, text_fld)
values ('This is char data', 'This is varchar data', 'This is text data');

update string_tbl set vchar_fld = 'This is a piece of extremely long varchar data';

update string_tbl set text_fld = 'This string didn''t work, but it does now';


select QUOTE(text_fld) from string_tbl;
SELECT 'abcdefg', CHAR(97,98,99,100,101,102,103);
SELECT CHAR(128,129,130,131,132,133,134,135,136,137);
SELECT CHAR(138,139,140,141,142,143,144,145,146,147);
SELECT CHAR(158,159,160,161,162,163,164,165);

SELECT CONCAT('danke sch', CHAR(148), 'n');
SELECT ASCII('o ');

select length(char_fld), length(vchar_fld), length(text_fld) from string_tbl;
select position('characters' in vchar_fld) from string_tbl;
select locate('is', vchar_fld, 5) from string_tbl;

DELETE FROM string_tbl;
INSERT INTO string_tbl(vchar_fld) VALUES ('abcd');
INSERT INTO string_tbl(vchar_fld) VALUES ('xyz');
INSERT INTO string_tbl(vchar_fld) VALUES ('QRSTUV');
INSERT INTO string_tbl(vchar_fld) VALUES ('qrstuv');
INSERT INTO string_tbl(vchar_fld) VALUES ('12345');
select vchar_fld from string_tbl order by vchar_fld;

SELECT STRCMP('12345','12345') 12345_12345,
STRCMP('abcd','xyz') abcd_xyz,
STRCMP('abcd','QRSTUV') abcd_QRSTUV,
STRCMP('qrstuv','QRSTUV') qrstuv_QRSTUV,
STRCMP('12345','xyz') 12345_xyz,
STRCMP('xyz','qrstuv') xyz_qrstuv;

SELECT name, name LIKE '%ns' ends_in_ns  FROM department;
SELECT cust_id, cust_type_cd, fed_id, fed_id REGEXP '.{3}.{2}.{4}' is_ss_no_format FROM customer;

INSERT INTO string_tbl (text_fld) VALUES ('This string was 29 characters');
UPDATE string_tbl SET text_fld = CONCAT(text_fld, ', but now it is longer');

select text_fld from string_tbl;

SELECT CONCAT(fname, ' ', lname, ' has been a ', title, ' since ', start_date) emp_narrative
FROM employee
WHERE title = 'Teller' OR title = 'Head Teller';

SELECT INSERT('goodbye world', 9, 0, 'cruel ') string;
SELECT INSERT('goodbye world', 1, 7, 'hello') string;

SELECT SUBSTRING('goodbye cruel world', 9, 5);