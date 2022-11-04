--UC1 create data base--
--create database Payroll_Service;

--UC2 create table
use Payroll_Service;
if OBJECT_ID('tempdb..EmployeePayroll')is null
	drop table EmployeePayroll;
Create Table EmployeePayroll(Id int identity(1,1)primary key, Empname varchar(200),Salary bigint,Startdate date);

--UC3 insert record--
insert into EmployeePayroll(Empname,Salary,Startdate) values('Bill',100000,'2018-09-07');
insert into EmployeePayroll(Empname,Salary,Startdate) values('charlie',200000,'2019-07-04');
insert into EmployeePayroll(Empname,Salary,Startdate) values('Pooja',300000,'2018-08-06');
insert into EmployeePayroll(Empname,Salary,Startdate) values('Abhi',250000,'2019-03-01');

--UC4 Retrieve the data--
select * from EmployeePayroll;

--UC5-Retrive Salary Data--
select * from EmployeePayroll WHERE Startdate BETWEEN CAST('2019-02-13' AS DATE) AND Getdate();

--UC6-Add Emp Gender--
alter table EmployeePayroll add Gender char(1)
update EmployeePayroll set Gender = 'M' where Empname='Bill'
update EmployeePayroll set Gender = 'M' where Empname='charlie'
update EmployeePayroll set Gender = 'M' where Empname='Abhi'
update EmployeePayroll set Gender = 'F' where Empname='Pooja'
select * from EmployeePayroll;

--UC7-Avg, sum, max, min salary
select Sum(Salary) from EmployeePayroll where Gender='M' group by Gender;
select Sum(Salary) as Total_Sum from EmployeePayroll where Gender='M' group by Gender;
select Avg(Salary) as Total_Avg from EmployeePayroll where Gender='M' group by Gender;
select Min(Salary) as Minsalary from EmployeePayroll where Gender='M' group by Gender;
select Max(Salary) as Maxsalary from EmployeePayroll where Gender='M' group by Gender;
select COUNT (*)TotalRecord from EmployeePayroll;