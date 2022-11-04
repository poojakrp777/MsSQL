--UC1 Create data base
--create database AddressBook_dB
--UC2 Create table
use AddressBook_dB
if OBJECT_ID('tempdb..AddressBook')is null
	drop table AddressBook;
create table AddressBook (FirstName varchar (200), LastName varchar (200), Address varchar (200),
City varchar (200), State varchar (200), Zip int , PhoneNumber bigint, Email varchar (200))

--UC 3 Adding Contact
insert into AddressBook values('Pooja', 'K R', 'TVK', 'TMK', 'KAR', 572, 9663581934, 'pooja@gmail.com')
insert into AddressBook values('Abhi', 'Gowda', 'Laggere', 'BNG', 'KAR', 568, 8105924624, 'abhi@gmail.com')
select * from AddressBook

--UC 4 Edit Contact
update AddressBook set State= 'UP' where FirstName='Pooja'
select * from AddressBook

--UC 5 Delete Person 
delete AddressBook where LastName='K R'
select * from AddressBook

--UC 6 Retrive person using state
insert into AddressBook values('Ankitha', 'P', 'BNG', 'BNG', 'TN', 526, 9648236425, 'anki@gmail.com')
insert into AddressBook values('Basava', 'raj', 'kdr', 'ckm', 'Kar', 556, 5577669988, 'basu@gmail.com')
insert into AddressBook values('Pavitra', 'GOWda', 'tvk', 'tmk', 'kar', 572, 9589256316, 'pavitra@gmail.com')
select * from AddressBook where State= 'TN'
select * from AddressBook where City= 'ckm'

--UC7 the size of address book
select count (State) totalrecord from AddressBook
select * from AddressBook

--UC 8 sorted alphabetically by Person’s name for a given city
select * from AddressBook Order By FirstName ASC
select * from AddressBook Order By FirstName DESC

--UC 9 Address Book with name and Type.
alter table AddressBook add Type varchar(200)
select * from AddressBook

update AddressBook set Type='Friend' where FirstName='Abhi'
update AddressBook set Type='Family' where FirstName='Ankitha'
update AddressBook set Type='Profession' where FirstName='Basava'
update AddressBook set Type='Friend' where FirstName='Pavitra'
select * from AddressBook
