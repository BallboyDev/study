-- GROUP BY 절에 여러 컬럼 사용
-- ex5) 현재 직책별로 평균 연봉과 인원수를 구하되 직책별로 인원이 100명 이상인 직책만 출력하세요
select 	title, avg(c.salary), count(*)
from 	employees a
join 	titles b 	using (emp_no)
join 	salaries c	using (emp_no)
where 	b.to_date = '9999-01-01'
and 	c.to_date = '9999-01-01'
group 	by b.title
having 	count(b.title) > 100;

-- ex5) 강사님 풀이
select 	title, avg(b.salary), count(*) as cnt
from 	employees a, salaries b, titles c
where	a.emp_no = b.emp_no
and		a.emp_no = c.emp_no
and 	b.to_date = '9999-01-01'
and 	c.to_date = '9999-01-01'
group	by c.title
having	cnt > 100;

-- ex6) 현재 부서별로 현재 직책이 Engineer인 직원들에 대해서만 평균급여를 구하세요
select 	d.dept_name, avg(e.salary)
from 	employees a
join 	titles b		using (emp_no)
join 	dept_emp c		using (emp_no)
join 	departments d	using (dept_no)
join 	salaries e		using (emp_no)
where 	b.title = 'Engineer'
and		b.to_date = '9999-01-01'
and		c.to_date = '9999-01-01'
and		e.to_date = '9999-01-01'
group	by d.dept_name;

-- ex6) 강사님 풀이 --> 에러 발생!!!! 에러 찾아 내기
select 	d.dept_name, avg(e.salary)
from 	employees a, dept_emp b, titles c, departments d, salaries e
where 	a.emp_no = b.emp_no
and 	a.emp_no = c.emp_no
and 	a.emp_no = e.emp_no
and 	b.dept_no = d.dept_no
and		b.to_date = '9999-01-01'
and 	c.to_date = '9999-01-01'
and		c.title = 'Engineer'
group 	by d.dept_name;



-- ex7) 현재 직책별로 급여의 총합을 구하되 Engineer직책은 제외하세요 단, 총합이 2,000,000,000이상인 직책만 나타내며 급여총합에 대해서 내림차순(DESC)로 정렬하세요 
select 	b.title, sum(c.salary)
from 	employees a
join 	titles b 		using (emp_no)
join 	salaries c		using (emp_no)
where 	b.title <> 'Engineer'
and 	b.to_date = '9999-01-01'
and 	c.to_date = '9999-01-01'
group 	by b.title
having 	sum(c.salary) > 2000000000
order 	by sum(c.salary) desc;

-- ex7) 강사님 풀이


--
-- 테이블간 조인(JOIN) SQL 문제입니다.
--

-- 문제 1. 
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.
select	a.emp_no, concat(a.first_name, ' ', a.last_name), b.salary
from	employees a
join 	salaries b
using	(emp_no)
where 	b.to_date = '9999-01-01'
order 	by b.salary desc;

-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.
select 	a.emp_no, concat(a.first_name, ' ', a.last_name), b.title
from 	employees a
join 	titles b
on 		a.emp_no = b.emp_no
order	by concat(a.first_name, ' ', a.last_name) asc;

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..
select 	a.emp_no, concat(a.first_name, ' ', a.last_name), c.dept_name
from 	employees a

join 	dept_emp b
on		a.emp_no = b.emp_no
join	departments c
on		b.dept_no = c.dept_no
where 	b.to_date = '9999-01-01'
order	by concat(a.first_name, ' ', a.last_name);

-- 문제4.
-- 전체 사원의 사번, 이름, 연봉, 직책, 부서를 모두 이름 순서로 출력합니다.
select 	a.emp_no, concat(a.first_name, ' ', a.last_name), b.salary, c.title, e.dept_name
from 	employees a
join 	salaries b 		using (emp_no)
join	titles c 		using (emp_no)
join 	dept_emp d		using (emp_no)
join	departments e	using (dept_no)
where 	b.to_date = '9999-01-01'
and 	c.to_date = '9999-01-01'
and 	d.to_date = '9999-01-01'
order	by concat(a.first_name, ' ', a.last_name);

-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의 사번과 이름을 출력하세요. (현재 ‘Technique Leader’의 직책(으로 근무하는 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력 합니다.
select * from titles where title = 'Technique Leader';
select 	a.emp_no, concat(a.first_name, ' ', a.last_name)
from 	employees a
join	titles b	using (emp_no)
where 	b.title = 'Technique Leader'
and 	b.to_date <> '9999-01-01';

-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명, 직책을 조회하세요.
select 	concat(a.first_name, ' ', a.last_name), b.title, d.dept_name
from 	employees a
join 	titles b 		using (emp_no)
join 	dept_emp c 		using (emp_no)
join 	departments d 	using (dept_no)
where 	a.last_name like 'S%'
and 	b.to_date = '9999-01-01'
and 	c.to_date = '9999-01-01';

-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가 큰 순서대로 출력하세요.
select 	*
from 	employees a
join 	titles b using (emp_no)
join 	salaries c using (emp_no)
where 	b.title = 'Engineer'
and		b.to_date = '9999-01-01'
and 	c.salary > 40000
and		c.to_date = '9999-01-01'
order	by c.salary desc;

-- 문제8.
-- 현재 급여가 50000이 넘는 직책을 직책, 급여로 급여가 큰 순서대로 출력하시오
select 	distinct b.title, c.salary
from 	employees a
join 	titles b	using (emp_no)
join 	salaries c	using (emp_no)
where 	c.salary > 50000
and 	b.to_date = '9999-01-01'
and 	c.to_date = '9999-01-01'
order 	by c.salary desc;

-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.
select 	c.dept_name, avg(d.salary)
from 	employees a
join	dept_emp b		using (emp_no)
join 	departments c	using (dept_no)
join 	salaries d	 	using (emp_no)
where	b.to_date = '9999-01-01'
and 	d.to_date = '9999-01-01'
group	by c.dept_name
order 	by avg(d.salary) desc;

-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.
select 	b.title, avg(c.salary)
from 	employees a
join 	titles b 	using (emp_no)
join 	salaries c	using (emp_no)
where	b.to_date = '9999-01-01'
and		c.to_date = '9999-01-01'
group	by b.title
order 	by avg(c.salary) desc;

