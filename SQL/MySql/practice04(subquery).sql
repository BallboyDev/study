show tables;
-- 서브쿼리(SUBQUERY) SQL 문제입니다.

-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?
select 	count(salary)
from 	salaries
where 	to_date = '9999-01-01'
and 	salary > (	select avg(salary)
					from salaries
                    where to_date = '9999-01-01'
					);


-- 문제2. -- 다시 확인해보기
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번, 이름, 부서 연봉을 조회하세요. 단 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다. 
select 	a.emp_no, concat(a.first_name, ' ', a.last_name), c.dept_name, max(d.salary) as max_salary
from 	employees a
join	dept_emp b		using(emp_no)
join 	departments c	using(dept_no)
join 	salaries d		using(emp_no)
where 	b.to_date = '9999-01-01'
and 	d.to_date = '9999-01-01'
group	by c.dept_name
order 	by max_salary desc;


-- 문제3. -- 패스
-- 현재, 자신의 부서 평균 급여보다 연봉(salary)이 많은 사원의 사번, 이름과 연봉을 조회하세요 
select 	c.dept_name, avg(d.salary)
from 	employees a
join 	dept_emp b 		using (emp_no)
join 	departments c	using (dept_no)
join 	salaries d		using (emp_no)
where 	b.to_date = '9999-01-01'
and 	d.to_date = '9999-01-01'
group 	by c.dept_name;

select 	*
from 	employees a
join 	dept_emp b		using (emp_no)
join 	departments c	using (dept_no)
join 	salaries d		using (emp_no)
where	d.salary > (	select 	avg(d.salary)
						from 	employees a
						join 	dept_emp b 		using (emp_no)
						join 	departments c	using (dept_no)
						join 	salaries d		using (emp_no)
						where 	b.to_date = '9999-01-01'
						and 	d.to_date = '9999-01-01'
						group 	by c.dept_name)
group	by c.dept_name;
                        

select 	*
from	


select emp_no
from salaries
where salary < 50000
and to_date = '9999-01-01';


-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
select	a.first_name, c.dept_name
from 	employees a
join	dept_emp b		using (emp_no)
join 	departments c	using (dept_no)
where	b.to_date = '9999-01-01';

select	a.first_name, c.dept_name
from 	employees a
join 	dept_manager b 	using (emp_no)
join	departments c	using (dept_no)
where 	b.to_date = '9999-01-01';

select 	d.first_name, a.f_name, c.dept_name
from 	(	select	a.first_name as f_name, c.dept_name as d_name
			from 	employees a
			join 	dept_manager b 	using (emp_no)
			join	departments c	using (dept_no)
			where 	b.to_date = '9999-01-01') a, employees d
join	dept_emp b		using (emp_no)
join 	departments c	using (dept_no)
where	a.d_name = c.dept_name
and 	b.to_date = '9999-01-01';


-- 문제5.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로 출력하세요.
select 	c.dept_name, avg(d.salary) as avg_salary
from 	employees a
join 	dept_emp b 		using (emp_no)
join 	departments c	using (dept_no)
join 	salaries d		using (emp_no)
where 	b.to_date = '9999-01-01'
and 	d.to_date = '9999-01-01'
group 	by c.dept_name
order 	by avg_salary desc
limit	0, 1;

select 	a.d_name, max(a.avg_salary)
from 	(	select 	c.dept_name as d_name, avg(d.salary) as avg_salary
			from 	employees a
			join 	dept_emp b 		using (emp_no)
			join 	departments c	using (dept_no)
			join 	salaries d		using (emp_no)
			where 	b.to_date = '9999-01-01'
			and 	d.to_date = '9999-01-01'
			group 	by c.dept_name
            order 	by avg_salary desc
            limit	0, 1) a;
            
select 	*
from 	employees a
join 	dept_emp c		using (emp_no)
join 	departments d	using (dept_no)
join	(	select 	c.dept_name as d_name, avg(d.salary) as avg_salary
			from 	employees a
			join 	dept_emp b 		using (emp_no)
			join 	departments c	using (dept_no)
			join 	salaries d		using (emp_no)
			where 	b.to_date = '9999-01-01'
			and 	d.to_date = '9999-01-01'
			group 	by c.dept_name
            order 	by avg_salary desc
            limit	0, 1) b on d.dept_name = b.d_name
where 	c.to_date = '9999-01-01'
order 	by a.emp_no;



-- 문제6.
-- 평균 연봉이 가장 높은 부서는? 

-- 문제7.
-- 평균 연봉이 가장 높은 직책?

-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

