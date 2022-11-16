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
update AddressBook set Type='Friend' where FirstName='Pooja'
select * from AddressBook

--UC 10 count by type
select count (Type) from AddressBook where Type= 'Family'
select count (Type) from AddressBook where Type= 'Profession'
select count (Type) from AddressBook where Type= 'Friend'

--UC 11 add person to both Friend and Family
insert into AddressBook values ('kavi', 'pkr', 'bng', 'lgr', 'kar', 573, 95893478962, 'kavi@gmail.com','Friend And Family' )
select * from AddressBook

--UC12 - Creating different entities.
--creating table of typeofcontacts
create table TypesOfContacts
(typeid int primary key ,typename varchar(50) not null);

--inserting data into type of contacts
insert into Typesofcontacts values(1,'Family'),(2,'Friends'),(3,'Business');

alter table AddressBook
add contactid int primary key identity(1,1);
select * from AddressBook;

--Creating table of address book names
create table AddressBookNames(addressBookId int primary key identity(1,1),addressBookName varchar(50) not null );
--inserting values to addressbook table
insert into AddressBooknames values ('P'),('A'),('B');
select * from AddressBookNames;

--creating table address book names mapper which will contain contact id and address book names id
create table AddressbookMapping(contactid int not null, addressbookid int not null);
--inserting data into address book mapper id
insert into AddressbookMapping values (1,1),(2,1),(3,2);
select * from AddressbookMapping;

select a.firstname, a.phoneNumber, a.city, a.state, a.eMail, b.addressbookname, b.addressBookId
from AddressBook a
join AddressbookMapping d
on a.contactid = d.contactId
join AddressBookNames b
on b.addressBookId= d.addressbookId

--UC13 - Retrieving data using new table structure.
--For UC6
select FirstName,LastName,city from AddressBook where FirstName='Pooja';

--For UC7
select city,count(*) from AddressBook where city='BNG' group by city;

--For UC8
select * from  AddressBook where city='ckm' order by FirstName,LastName;
