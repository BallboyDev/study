-- column heading alias
SELECT 
    emp_no AS '번 호',
    first_name AS '이 름',
    hire_date AS '입사일'
FROM
    employees;
    
-- concat column의 값을 합친것  
SELECT 
    emp_no AS '번 호',
    CONCAT(first_name, ' ', last_name) AS '이 름',
    hire_date AS '입사일'
FROM
    employees;
  
-- distinct
select distinct title from titles order by title;

SELECT 
    CONCAT(first_name, ' ', last_name), gender, hire_date
FROM
    employees
ORDER BY hire_date desc;

-- salaries 테이블에서 2001년 월급을 가장 높은순으로 사번, 월급순으로 출력
SELECT 
    *
FROM
    salaries
WHERE
    from_date LIKE '2001-%'
ORDER BY salary DESC;

SELECT 
    *
FROM
    salaries
WHERE
    '2000-12-31' < from_date
        AND from_date < '2002-01-01'
ORDER BY salary DESC;

-- employees 테이블에서 1991년 이전에 입사한 직원의 이름, 성별, 입사일을 출력
SELECT 
    first_name, gender, hire_date
FROM
    employees
WHERE
    hire_date < '1991-01-01'
ORDER BY hire_date DESC;

-- employees 테이블에서 1989년 이전에 입사한 여직원의 이름, 입사일을 출력
SELECT 
    first_name, hire_date
FROM
    employees
WHERE
    gender = 'f'
        AND hire_date < '1989-01-01';

-- dept_emp 테이블에서 부서 번호가 d005나 d009에 속한 사원의 사번, 부서 번호 출력
SELECT 
    *
FROM
    dept_emp
WHERE
    dept_no IN ('d005' , 'd009');
    
-- employees 테이블에서 1989년에 입사한 직원의 이름, 입사일을 출력
SELECT 
    first_name, hire_date
FROM
    employees
WHERE
    hire_date LIKE '1989-%';
    