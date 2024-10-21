----1.	Display the employee id, surname and firstname whose employee id is equal to 110.---
SELECT employee_id
       , last_name
       , first_name
 FROM hr.employees
 WHERE employee_id = 110;  
 
 ----2.	Display the employee id, surname, firstname, manager id, job id and salary whose manager id is equal to 100.---
 SELECT employee_id
       , last_name
       , first_name
       , manager_id
       , job_id
       , salary
 FROM hr.employees
 WHERE manager_id = 100;  
 
 ---3.	Display the employee id, surname, firstname and hire date of all employees whose hire dates are between January 01, 2005 and Dec. 31, 2010.---
 SELECT employee_id
       , last_name
       , first_name
       , hire_date
 FROM hr.employees
 WHERE hire_date BETWEEN  TO_DATE('01-JAN-2005','DD-MON-YYYY')
                      AND TO_DATE('31-DEC-2010', 'DD-MM-YYYY');  
                          
----4.	Display all fields of hr.employees whose salaries are greater or equal to 10,000.---
 SELECT * FROM hr.employees
 WHERE salary >= 10000;  
 
 ----5.	Display the employee id, surname, firstname, hire date and salary of all employees whose hire dates are between January 01, 2020 and Dec. 31, 2024 or salaries are in the range of 100 to 15000.---
 SELECT employee_id
       , last_name
       , first_name
       , hire_date
       , salary
 FROM hr.employees
 WHERE (hire_date BETWEEN  TO_DATE('01-JAN-2020','DD-MON-YYYY')
                      AND TO_DATE('31-DEC-2024', 'DD-MM-YYYY')) 
 OR (salary between 100 AND 15000);  
 
----6.	Display the employee id, surname, firstname, hire date, salary, job id and department id of all employees whose job ids contain a string ‘CLERK’ and department ids equal to 10,20,30,40 and 50.---
  SELECT employee_id
       , last_name
       , first_name
       , hire_date
       , salary
       , job_id
       , department_id
 FROM hr.employees WHERE job_id LIKE '%CLERK%' AND department_id IN (10,20,30,40,50); 
 
 ----7.	Display the employee id, surname, firstname, hire date, salary, job id, department id and the below condition (name the derived column as Remarks):
-----If commission_pct is null then make it 0 else display the commission_pct.---
SELECT employee_id
       , last_name
       , first_name
       , hire_date
       , salary
       , job_id
       , department_id
       , CASE WHEN commission_pct IS NULL THEN 0 
              WHEN commission_pct IS NOT NULL THEN commission_pct 
       END AS Remarks
FROM hr.employees;

 ----8.	Repeat question # 4 and add a derived column (alternale_email) by getting only the first 5 letters of an employee’s surname and firstname. Concatenate this by adding ‘@plm.edu.ph’.
---Example:    ATIEN_FRANC@plm_edu.ph
---Note: If there are surnames that contain space/s, delete it.
---Example: De Los Santos  ->  DELOS

SELECT employee_id, 
       first_name, 
       last_name, 
       email, 
       phone_number, 
       hire_date, 
       job_id, 
       salary, 
       commission_pct, 
       manager_id, 
       department_id,
       UPPER(SUBSTR(REPLACE(last_name, ' ', ''), 1, 5) || '_' || 
       SUBSTR(REPLACE(first_name, ' ', ''), 1, 5) || '@plm.edu.ph') AS alternate_email
FROM hr.employees
WHERE salary >= 10000;


----9.	Repeat question # 5 by adding a derived column (salary_increase) by increasing the employee’s salary by 10%.
---Example: Employee’s salary = 10,000 then salary_increase = 11,000.

SELECT employee_id, 
       last_name, 
       first_name, 
       hire_date, 
       salary, 
       salary * 1.10 AS salary_increase
FROM hr.employees
WHERE (hire_date BETWEEN TO_DATE('01-JAN-2020', 'DD-MON-YYYY')
                    AND TO_DATE('31-DEC-2024', 'DD-MON-YYYY'))
   OR (salary BETWEEN 100 AND 15000);

 
 ----10. Repeat question #1 and the output should have surnames and firstnames arranged ascendingly.
 SELECT employee_id, 
       last_name, 
       first_name
FROM hr.employees
WHERE employee_id = 110
ORDER BY last_name ASC, first_name ASC;

--11. Modify the commission_pct of all employees to 0 whose manager id is equal to 101,102,103 and 104.
UPDATE hr.employees
SET commission_pct = 0
WHERE manager_id IN (101, 102, 103, 104);


--12. Modify the salary of all employees to 20,000 whose job_ids are IT_PROG and commission_pct is NULL.
UPDATE hr.employees
SET salary = 20000
WHERE job_id = 'IT_PROG'
AND commission_pct IS NULL;


--13. Modify  manager id to 100, salary to 25000 and email to ‘default@plm.edu.ph’ whose employee ids are 101 to 110 and their hire dates are between Jan, 01, 1900 to Dec. 31, 2024. 
UPDATE hr.employees
SET manager_id = 100,
    salary = 25000,
    email = 'default_' || employee_id || '@plm.edu.ph'
WHERE employee_id BETWEEN 101 AND 110
  AND hire_date BETWEEN TO_DATE('01-JAN-1900', 'DD-MON-YYYY') 
                    AND TO_DATE('31-DEC-2024', 'DD-MON-YYYY');
                    

--14.	Delete all employee records whose manager ids are 120,121,122 and123 or job_ids are ‘AD_PRES’.
DELETE FROM hr.employees
WHERE manager_id IN (120, 121, 122, 123)
   OR job_id = 'AD_PRES';

   
--15.	Delete all employee records whose salaries are 0 to 5000 and department ids are 10,20,50,70 and 90.
DELETE FROM hr.employees
WHERE salary BETWEEN 0 AND 5000
  AND department_id IN (10, 20, 50, 70, 90);


--16.	Delete all records in JOBS table whose job ids have the string ‘AD’ anywhere on it. (Provide the error message and explain.) 
DELETE FROM hr.jobs
WHERE job_id LIKE '%AD%';


--17.	Delete all employee records whose employee ids are not equal to 131,132,133,134 and 150.
DELETE FROM hr.employees
WHERE employee_id NOT IN (131, 132, 133, 134, 150);

--18.	Rollback everything you made in #s 11 to 17.
ROLLBACK;




 
 
 
 
 