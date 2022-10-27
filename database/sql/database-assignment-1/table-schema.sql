/*
CREATE TABLE IF NOT EXISTS `works` (
  `employee-name` varchar(50),
  `company-name` varchar(50),
  `salary` double(8,2) NOT NULL
)
;

CREATE TABLE IF NOT EXISTS `managers` (
  `employee-name` varchar(50),
  `manager-name` varchar(50),
  PRIMARY KEY (`employee-name`)
)
;

CREATE TABLE IF NOT EXISTS `employee` (
  `employee-name` varchar(50),
  `street` varchar(200),
  `city` varchar(40),
  PRIMARY KEY (`employee-name`)
);

CREATE TABLE IF NOT EXISTS `company` (
  `company-name` varchar(50),
  `city` varchar(40),
  PRIMARY KEY (`company-name`)
)
;

*/

#Ans to the question 1(a)
SELECT 
	employee.`employee-name`
	, employee.street
	, employee.city
FROM employee 
JOIN works ON employee.`employee-name` = works.`employee-name`
JOIN company ON company.`company-name` = works.`company-name`
WHERE company.`company-name` = 'Janata Bank'
;

#Ans to the question 1(b)
SELECT 
	employee.`employee-name`
FROM employee 
JOIN works ON employee.`employee-name` = works.`employee-name`
JOIN company ON company.`company-name` = works.`company-name`
WHERE company.city = employee.city
;

#Ans to the question 1(c)
SELECT 
	e.`employee-name`

FROM employee e
	
JOIN managers AS wu ON e.`employee-name` = wu.`employee-name` 
JOIN employee AS m ON m.`employee-name` = wu.`manager-name`

WHERE e.city = m.city AND e.street = m.street

;
#Ans to the question 1(d)
SELECT 
	employee.`employee-name`
FROM employee 
JOIN works ON employee.`employee-name` = works.`employee-name`
JOIN company ON company.`company-name` = works.`company-name`
WHERE company.`company-name` != 'First Bank Corporation'
;

#Ans to the question 1(e)
SELECT 
	`employee-name`
FROM works 
WHERE salary > ANY( SELECT salary FROM works WHERE `company-name` = 'Sonali Bank' )
;

#Ans to the question 1(f)
SELECT 
	*
FROM company
WHERE city IN ( SELECT city FROM company WHERE `company-name` = 'Sonali Bank' )
;

#Ans to the question 1(g)
SELECT 
	`employee-name`
FROM works AS w 
WHERE w.salary > (
	SELECT AVG(salary) 
	FROM works WHERE `company-name` = w.`company-name` 
)
;
 

#Ans to the question 1(h)
SELECT `company-name`, MIN(salary) FROM works 



