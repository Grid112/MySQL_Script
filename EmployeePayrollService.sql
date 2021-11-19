show databases;

#UC1 - Create DB
create database payroll_services;
use payroll_services;
select database();

#UC2 - Create table
create table employee_payroll(id int unsigned not null auto_increment, name varchar(150) not null, salary double, start date not null, primary key (id));

#UC3 - Insert Contacts
insert into employee_payroll (name, salary, start) VALUES ('Charlie', 2000000.00, '2018-03-12'),('Terisa', 1500000.00, '2019-06-01'), ('Mike', 1800000.00, '2014-01-15');

#UC4 - Retrieve All Data
select * from employee_payroll;

#UC5 - retrieve salary data for a particular employee
select Salary from employee_payroll where name ='Bill';
select * from employee_payroll where StartDate between cast('2021-01-01' as Date ) AND DATE(NOW()) ;

#UC6 - add Gender to Employee Payroll Table and Update the Rows
alter table employee_payroll add gender char(1) after salary;
update employee_payroll set gender = 'M' where name in('Charlie','Mike');
update employee_payroll set gender = 'M' where name = 'Terisa';
select * from employee_payroll;

#UC7 - Find Sum Avg Min Max and Count from table
select sum(Salary) from employee_payroll where Gender = 'F' group by Gender;
select sum(Salary) from employee_payroll where Gender = 'M' group by Gender;

select avg(Salary) from employee_payroll where Gender = 'F' group by Gender;
select avg(Salary) from employee_payroll where Gender = 'M' group by Gender;

select min(Salary) from employee_payroll where Gender = 'F' group by Gender;
select min(Salary) from employee_payroll where Gender = 'M' group by Gender;

select max(Salary) from employee_payroll where Gender = 'F' group by Gender;
select max(Salary) from employee_payroll where Gender = 'M' group by Gender;

select count(Salary) from employee_payroll where Gender = 'F' group by Gender;
select count(Salary) from employee_payroll where Gender = 'M' group by Gender;

# UC8: Ability to Extend employee_payroll data to store employee Phone Number, Address and Department
alter table employee_payroll add phone_number char(12) after name;
alter table employee_payroll add address char(50) after phone_number;
alter table employee_payroll add department char(50) after address;
select * from employee_payroll;

# UC 9: Ability to extend employee_payroll table to store Basic Pay, Deductions, Taxable pay, Income tax, Net pay
alter table employee_payroll add basic_pay char(12) after gender;
alter table employee_payroll add deductions double after basic_pay;
alter table employee_payroll add taxable_pay double after deductions;
alter table employee_payroll add tax double after taxable_pay;
alter table employee_payroll add net_pay double after tax;
select * from employee_payroll;

# UC10: Ability to make Terissa as part of Sales and Marketing Department
insert into employee_payroll
(name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) values
('Terisa', 'Marketing', 'F', 3000000.00, 1000000.00, 2000000.00, 500000.00, 1500000.00, '2019-11-13');
insert into employee_payroll
(name, department, gender, basic_pay, deductions, taxable_pay, tax, net_pay, start) values
('Terisa', 'Sales', 'F', 3000000.00, 0.00, 0.00, 0.00, 0.00, '2019-11-13');
select * from employee_payroll;

# UC11: Create table of employee_department
create table employee_department (
department_id int unsigned not null auto_increment,
department char(50),
employee_id int unsigned not null,
PRIMARY KEY (department_id),
FOREIGN KEY (employee_id) REFERENCES employee_payroll(id)
			ON DELETE CASCADE
);

insert into employee_department (department, employee_id) values  ('Sales', 4);
insert into employee_department (department, employee_id) values  ('Marketing', 5);

select sum(basic_pay) from employee_payroll where gender = 'F' group by gender;
select sum(basic_pay) from employee_payroll where gender = 'M' group by gender;

select avg(basic_pay) from employee_payroll where gender = 'F' group by gender;
select avg(basic_pay) from employee_payroll where gender = 'M' group by gender;

select min(basic_pay) from employee_payroll where gender = 'F' group by gender;
select min(basic_pay) from employee_payroll where gender = 'M' group by gender;

select max(basic_pay) from employee_payroll where gender = 'F' group by gender;
select max(basic_pay) from employee_payroll where gender = 'M' group by gender;

select count(basic_pay) from employee_payroll where gender = 'F' group by gender;
select count(basic_pay) from employee_payroll where gender = 'M' group by gender;

# UC12: all retrieve query working with new table structure
select * from employee_department;
select * from employee_payroll;
select department from employee_department where department_id= 1;
select * from employee_payroll
	where start between cast('2018-01-01' as date) and date(now());


