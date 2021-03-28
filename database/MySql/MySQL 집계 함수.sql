-- 집계함수(통계)
select avg(salary), sum(salary) from salaries where emp_no = 10060;

-- 모든 사원들에 대해 연봉의 average
select emp_no, avg(salary), sum(salary) from salaries group by emp_no order by avg(salary);

select salary, from_date from salaries where emp_no = 10060;

select max_salary from ( select max(salary) as max_salary, min(salary) as min_salary from salaries where emp_no = 10060) a;

select emp_no, count(*) from titles group by emp_no order by count(*) desc;

select emp_no, avg(salary) from salaries group by emp_no having avg(salary) > 100000 order by avg(salary) desc;