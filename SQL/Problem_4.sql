/*
Create an SQL stored procedure that will allow you to obtain the average male
and female salary per department within a certain salary range. 
Let this range be defined by two values the user can insert when calling 
the procedure.
*/
SELECT 
    MIN(salary)
FROM
    t_salaries;
SELECT 
    MAX(salary)
FROM
    t_salaries;

drop procedure if exists filter_salary;

DELIMITER $$
create procedure filter_salary (IN p_min_salary FLOAT , IN p_max_salary FLOAT)
BEGIN
select e.gender, d.dept_name, AVG(s.salary) as avg_salary
from t_employees e
join t_salaries s on e.emp_no = s.emp_no
join t_dept_emp de on e.emp_no = de.emp_no
join t_departments d on de.dept_no = d.dept_no
where s.salary between p_min_salary and p_max_salary
group by  d.dept_no, e.gender;
END $$
DELIMITER ;

CALL filter_salary(50000, 90000);

