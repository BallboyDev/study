-- MySQL 문자열 함수

select ucase("Seoul"), upper("seoul"); -- 대문자로 변경
select lcase("Seoul"), lower("SEOUL"); -- 소문자로 변경

select substring("Happy Day", 3, 2);
select substring(first_name, 3, 2) from employees;
select substring("Happy Day", 3, 2) from dual; -- sql 표준 문법 (from절이 항상 들어가야 된다.)


SELECT 
    first_name, hire_date
FROM
    employees
WHERE
    hire_date LIKE '1989-%';
    
SELECT 
    first_name, hire_date
FROM
    employees
WHERE
    SUBSTRING(hire_date, 1, 4) = '1989';
    
select LPAD('hi', 10, '*') from dual;
select RPAD('hi', 10, '*') from dual;

SELECT 
    emp_no, LPAD(CAST(salary AS CHAR), 10, '*')
FROM
    salaries;
    
SELECT 
    CONCAT('-----', LTRIM('     hello     '), '-----'),
    CONCAT('-----', RTRIM('     hello     '), '-----'),
	concat('-----', trim('    hello    '), '-----');
    
select trim(both 'x' from 'xxxxhixxxx'),
		trim(leading 'x' from 'xxxxhixxxx'),
        trim(trailing 'x' from 'xxxxhixxxx');