-- SubQuery

-- 이름을 입력받아 dept_id를 출력하는 SQL
SELECT	c.dept_no
FROM    employees a,
		dept_emp c
WHERE   a.emp_no = c.emp_no
AND     c.to_date = '9999-01-01'
AND     concat(a.first_name, ' ', a.last_name) = 'Fai Bale';

-- dept_id를 입력받아 지원이름, 부서를 출력 하는 SQL
SELECT  a.emp_no,
        concat(a.first_name, ' ', a.last_name) AS name,
        b.dept_name
FROM    employees a, departments b, dept_emp c
WHERE   a.emp_no = c.emp_no
AND     c.dept_no = b.dept_no
AND     c.to_date = '9999-01-01'
AND     c.dept_no = 'd004'; -- 'Fai Baie 이가 근무하는 부서의 ID';

-- 현재 Fai Bale이 근무하는 부서에서의 근무하는 지원의 사번, 전체 이름을 출력하시오
SELECT  a.emp_no,
        concat(a.first_name, ' ', a.last_name) AS name,
        b.dept_name
FROM    employees a, departments b, dept_emp c
WHERE   a.emp_no = c.emp_no
AND     c.dept_no = b.dept_no
AND     c.to_date = '9999-01-01'
AND     c.dept_no = (	SELECT 	c.dept_no
						FROM    employees a,
								dept_emp c
						WHERE   a.emp_no = c.emp_no
						AND     c.to_date = '9999-01-01'
						AND     concat(a.first_name, ' ', a.last_name) = 'Fai Bale');
                    
                    
-- ----------------------------------------------------
                    

-- 현재 전체 사원의 평균 연봉보다 적은 급여를 받는 사원의 이름, 급여를 나타내세요
select avg(salary)
from salaries
where to_date = '9999-01-01';

select	*
from	employees a, salaries b
where	a.emp_no = b.emp_no
and		b.to_date = '9999-01-01'
and 	salary < (	select avg(salary) 
					from salaries 
					where to_date = '9999-01-01')
order by b.salary desc;

-- 현재 가장 적은 평균 급여를 받고 있는 직책에서의 평균 급여를 구하세요
-- 직책별 평균 급여
select 	title, avg(b.salary) as avg_salary
from 	titles a
join 	salaries b
on		a.emp_no = b.emp_no
where	b.to_date = '9999-01-01'
and	 	a.to_date = '9999-01-01'
group 	by title;

select 	min(avg_salary)
from	(	select 	title, 
					round(avg(b.salary)) as avg_salary
			from 	titles a
			join 	salaries b
			on		a.emp_no = b.emp_no
			where	b.to_date = '9999-01-01'
			and	 	a.to_date = '9999-01-01'
			group 	by title	) a;
            
select 	title, 
		round(avg(b.salary)) as avg_salary
from 	titles a
join 	salaries b
on		a.emp_no = b.emp_no
where	b.to_date = '9999-01-01'
and	 	a.to_date = '9999-01-01'
group 	by title
having	avg_salary = (	select 	min(avg_salary)
						from	(	select 	title, 
											round(avg(b.salary)) as avg_salary
									from 	titles a
									join 	salaries b
									on		a.emp_no = b.emp_no
									where	b.to_date = '9999-01-01'
									and	 	a.to_date = '9999-01-01'
									group 	by title
                                    order 	by title desc) a);

-- ----------------------------------------
-- 강사님 풀이

select 	title, avg(a.salary) as avg_salary
from 	salaries a, titles b, employees c
where 	c.emp_no = b.emp_no
and 	c.emp_no = a.emp_no
and 	a.to_date = '9999-01-01'
and 	b.to_date = '9999-01-01'
group 	by b.title
order 	by avg_salary asc
limit 	0, 1; -- Top-K 방식 (정렬을 해서 상위 몇개만 출력하는 방법)

-- 다중행 subquery
select salary from salaries;

-- = any() : in과 기능 동일 = 다음중 하나만 이라도 값이 같으면 됨
-- > any, < any, <> any(!= any 완전 동일), <= any, >= any
-- all 
-- = all*(이건 조심해야됨, 모든것과 같은것???, 단일행에서는 말이 된다.), > all, < all, <> all, <= all, >= all

-- ex)
-- 현재 급여가 50000 이상인 직원의 이름을 출력하라.
select 	emp_no
from 	salaries
where	to_date = '9999-01-01'
and		salary > 50000;

select 	concat(first_name, ' ', last_name), b.salary
from 	employees a, salaries b
where	a.emp_no = b.emp_no
and 	b.to_date = '9999-01-01'
and		(a.emp_no, b.salary) = any(	select 	emp_no, salary -- in과 동일
-- and		(a.emp_no, b.salary) in(	select	emp_no, salary -- = any와 동일
									from 	salaries
									where	to_date = '9999-01-01'
									and		salary > 50000);
                                    

select 	a.emp_no, concat(a.first_name, ' ', a.last_name), b.salary
from 	employees a, (	select 	emp_no, salary 
						from 	salaries
						where	to_date = '9999-01-01'
						and		salary > 50000) b
where	a.emp_no = b.emp_no;



