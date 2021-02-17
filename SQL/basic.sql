--create table
create table RealBatch
(employee_id INT,
first_name VARCHAR(20),
last_name VARCHAR(20),
salary INT);
​
-- insert values way 1
insert into RealBatch(employee_id,first_name,last_name,salary) values (1,'mehmet','gul',4000);
​
-- insert values way 2
insert into RealBatch values (3, 'hasan','kayar',3000);
​
--multiple data entery
insert all
into RealBatch values (10, 'hasan','kayar',3000)
into RealBatch values (11, 'naci','kayar',3000)
into RealBatch values (12, 'hasan','kayar',3000)
into RealBatch values (13, 'cemal','kayar',3000)
into RealBatch values (14, 'huseyin','kayar',3000)
select *  from dual;
​
--update rows
update realbatch set first_name='kemal' where employee_id=3;
​
--INSERT, UPDATE, , DELETE, ALTER, TRUNCATE, DROP
​
​
delete realbatch where first_name='kemal';
delete from realbatch;
TRUNCATE TABLE realbatch;
DROP TABLE realbatch;
​
--ALTER (ADD, DROP, RENAME, MODIFY)
alter table realbatch add emplyee_department varchar(20);
alter table realbatch drop COLUMN emplyee_department ;
alter table realbatch RENAME COLUMN salary to employee_salary;
alter table realbatch modify first_name varchar(50);
​
--Select keyword
select * from realbatch;
select first_name from realbatch;
select first_name,last_name from realbatch;
​
--getting data from multiple table
select realbatch.first_name, employees.last_name from realbatch, employees;
​
--logical operators
​
--distinct printing from each value one time. ommits repeats
select DISTINCT first_name from realbatch;
​
--null
select * from employees where manager_id is null;
select * from employees where manager_id is not null;
​
-- order by (sorting selected column )
select first_name,last_name from employees order by first_name asc;
select first_name,last_name from employees order by first_name desc;
select * from employees order by first_name desc;
​
​
-- agregates (max, min, avg,sum, count) 
select first_name,sum(salary) from employees group by first_name;
select first_name,last_name, avg(salary) from employees group by first_name,last_name;
select first_name,last_name, max(salary) from employees group by first_name,last_name;
select first_name,last_name, min(salary) from employees group by first_name,last_name;
select first_name,last_name, count(salary) from employees group by first_name,last_name;
select count(*) from employees;
​
-- using 2 querry together.
select * from employees where salary= (select max(salary) from employees);
select * from employees where salary< (select max(salary) from employees);
​
--second max salary
select max(salary) from employees where salary<(select max(salary)from employees);
--Third max salary
select max(salary) from employees where salary<(select max(salary) from employees where salary<(select max(salary) from employees));
​
​
-- HAVING is used only with GROUP BY
select first_name,max(salary) from employees group by first_name having max(salary)>15000;
select first_name,max(salary) from employees group by first_name having first_name='Steven';
​
-- using % LIKE
select first_name from employees where first_name like 'A%';
select first_name from employees where first_name NOT like 'Al%';
select first_name from employees where first_name like '%a';
select first_name from employees where first_name like '%e%';
select first_name from employees where first_name like 'S%';
select first_name from employees where first_name like 'S_____'; 
select first_name from employees where first_name like 'S%' or first_name like 'A%';
​
​
-- IN ,NOT IN, BETWEEN
select * from employees;
select * from employees where department_id in(30,60,100);
select * from employees where department_id not in(30,60,100);
select * from employees where department_id between 30 and 100;
​
--Alias to make the column names shorter to use. to compbine to column used concate ||
select first_name as Name from employees; 
select first_name ||' '|| last_name as "Full Name" from employees; 
select email||'@gmail.com' from employees;
select concat(concat(first_name, ' '),last_name) from employees;
select concat((first_name|| ' '),last_name) from employees;
select concat(concat(first_name, ' '),last_name) as "full NAme" from employees;
​
-- LENGTH
select first_name, LENGTH( first_name) from employees;
select first_name ||' '|| last_name as "full name", LENGTH( first_name||' '||last_name) from employees;
​
​
--SUBSTR()  substring
select first_name, substr(first_name,0,4) from employees;
select first_name, substr(first_name,0,1) from employees;
select first_name, substr(first_name,0,3) from employees;
select first_name, substr(first_name,0,4) from employees;
select substr(first_name,0,4) from employees;
select first_name ||' ' ||last_name as "Full name", substr(last_name,0,4) from employees;
​
--UPPER and LOWER Case
select lower(first_name),upper(last_name) from employees;
​
--REPLACE 
select first_name "Before Changes", replace(first_name, 'e','a') "After Changes" from employees;
​
--TRIM
select '   '||first_name from employees;
select trim('   '||first_name) from employees;
select trim('@' from first_name) from employees;
​
-- 'Create VIEW' TABLE - 'Creat or Replace View' table
create view employee_dtails as select first_name, last_name,employee_id from employees;
create or replace view employee_dtails as select first_name, last_name,salary from employees;
​
​
​
--UNION and UNION ALL
select * from realbatch union all select * from realbatch2;
select * from realbatch union select * from realbatch2;
select first_name from realbatch union all select first_name from realbatch2; --combines all values and display them
select first_name from realbatch union select first_name from realbatch2; -- it doesn't display the repeating ones.
​
​
-- MINUS
select first_name from realbatch minus select first_name from realbatch2;
​
--INTERSECT
select first_name from realbatch intersect select first_name from realbatch2;
​
​
--JOINS( INNER JOINS, LEFT JOINS, RIGHT JOINS, SELF JOIN)
select d.department_name , e.first_name from employees E inner join departments D on e.department_id = d.department_id;
select d.department_name , e.first_name from employees E right join departments D on e.department_id = d.department_id;
select d.department_name , e.first_name from employees E left join departments D on e.department_id = d.department_id;
​
--self join
select e1.first_name , e2.first_name from employees E1 join employees E2 on e1.department_id = e2.employee_id;
​
​
--From Rahul
# Unique Names in EmployeeTable
select distinct name from employeeinfo;
​
#get the employees name of newyork
select name from employeeinfo where location='newyork';
​
#get the employees name of newyork where there age should be more than 23
select name from employeeinfo where location='newyork' and age>23;
​
#get the employees name of Florida where there age should be less than 23 or location is from charlotte
select name from employeeinfo where (location='florida' and age<23) or location='charlotte';
select name from employeeinfo where id=1 or location ='florida';
​
#Print the employnames whose age should be between 22 and 25
select name from employeeinfo where age in(22,23,24,25);
select name from employeeinfo where location in('florida','newyork');
​
#print the emplyeenames whose id lies between 1 and 1000
select name from employeeinfo where id between 1 and 1000;
