-- equijoin(inner join)
-- 현재 근무하는 직원의 이름과 직책을 출력하세요
select 	a.emp_no, a.first_name, b.title
from	employees a, titles b
where	a.emp_no = b.emp_no			-- join 조건
and		b.to_date = '9999-01-01';	-- 선택 조건

-- 현재 근무중인 직책이 Senior Engineer인 직원의 이름과 직책을 출력하세요
select	a.emp_no, a.first_name, b.title
from	employees a, titles b
where	a.emp_no = b.emp_no
and		b.to_date = '9999-01-01'
and		b.title = 'Senior Engineer';

-- 현재 근무중인 직책이 Senior Engineer이인 여성 직원의 이름과 직책을 출력하세요
select	a.emp_no, a.first_name, b.title, a.gender
from	employees a, titles b
where	a.emp_no = b.emp_no
and		b.to_date = '9999-01-01'
and 	b.title = 'Senior Engineer'
and 	a.gender = 'f';

--
-- ANSI/ISO SQL의 JOIN
--
-- 1. Natural Join
select 	a.emp_no, a.first_name, b.title
from	employees a	
join titles b on a.emp_no = b.emp_no
where	b.to_date = '9999-01-01';

select	a.emp_no, a.first_name, b.title
from	emplyees a
natural
join	titles b
where	b.to_date = '9999-01-01';

-- 2. join ~ using
select 	a.emp_no, a.first_name, b.title
from	employees a	
join	titles b 
using	(emp_no)
where	b.to_date = '9999-01-01';

-- 3. join ~ on
select 	a.emp_no, a.first_name, b.title
from	employees a	
join	titles b 
on		a.emp_no = b.emp_no
where	b.to_date = '9999-01-01';

-- ex1)
-- 현재 회사 상황을 반영한 직원별 근무부서를 사번, 직원 전체이름, 근무부서 형태로 출력하시오
select	a.emp_no, a.first_name, c.dept_name
from	employees a, dept_emp b, departments c
where	a.emp_no = b.emp_no
and		b.dept_no = c.dept_no
and		b.to_date = '9999-01-01'
order	by	a.last_name asc;

-- ex2)
-- 현재 회사에서 지급되고 있는 급여 체계를 반영한 결과를 출력하시오 (사번, 전체이름, 연봉 형태)
select	a.emp_no, a.first_name, b.salary
from	employees a, salaries b
where	a.emp_no = b.emp_no
and		b.to_date = '9999-01-01';

