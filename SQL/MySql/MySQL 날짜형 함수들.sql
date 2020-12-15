-- MySQL 날짜형 함수들
select curdate(), current_date;
select curtime(), current_time;
select now(), sysdate();

-- cf 
-- now()는 쿼리가 실행 될 때 시간이 계속 유지
-- sysdate()은 출력 될 때 마다 현재 시간으로 세팅
select emp_no, now() from employees;
select emp_no, sysdate() from employees;

-- 포멧팅
SELECT 
    first_name, date_format(hire_date, '%y년 %m월 %d일  %h시 %i분 %s초')
FROM
    employees;
    
-- 각 직원들에 대해 직원의 이름과 근무 개월수
select first_name, period_diff(date_format(curdate(), '%Y%m'), date_format(hire_date, '%Y%m')) from employees; 

-- 각 사원 입사 후, 6개월 뒤에 정규직으로 발령이 된다.
-- 발령날은 언제?
-- month, week, year, day
select first_name, hire_date, date_add(hire_date, interval 6 month) from employees;

select date_add(cast('1994-03-29'as date), interval 10000 day);