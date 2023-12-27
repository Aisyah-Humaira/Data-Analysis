/*
Compare the average salary of female versus male employees
in the entire company until year 2002
and add a filter allowing you to see that per each department.
*/

SELECT 
    e.gender,
    d.dept_name,
    round(avg(s.salary),2) as salary,
    YEAR(s.from_date) AS calendar_year
FROM
    t_employees e
        JOIN
    t_salaries s ON e.emp_no = s.emp_no
        JOIN
    t_dept_emp de ON de.emp_no = e.emp_no
        JOIN
    t_departments d on d.dept_no = de.dept_no
GROUP BY d.dept_no, e.gender, calendar_year 
HAVING calendar_year <= 2002
order by d.dept_no;