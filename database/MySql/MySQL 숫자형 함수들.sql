-- MySQL 숫자형 함수들
select abs(10), abs(-10);
select mod(234, 10), 254 % 10;
select floor(1.23), floor(-1.23);
select ceil(3.14), ceiling(3.14),
       ceil(-3.14), ceiling(-3.14);
       
select round(-1.23), round(-1.58), round(1.58);
select round(1.298, 1), round(1.298, 0);
select pow(2, 2), power(2, -2);

select sign(-10), sign(0), sign(100);
select greatest(2, 4, 3, 6, 5, 1, 7, 1, 400192);
select greatest('A', 'B', 'C', 'D', 'E');
select greatest("ABCD", "ABCF", "b");

select least(2, 4, 3, 6, 5, 1, 7, 1, 400192);
select least('A', 'B', 'C', 'D', 'E');
select least("ABCD", "ABCF", "b");

