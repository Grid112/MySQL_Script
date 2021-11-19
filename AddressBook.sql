show databases;

#UC1 - Create DB
create database address_book_service;
use address_book_service;
select database();

#UC2 - Create table
create table Contacts(id int unsigned NOT NULL AUTO_INCREMENT, Name varchar(150) NOT NULL, Address varchar(150) NOT NULL, City varchar(150) NOT NULL, State varchar(150) NOT NULL, Zip int NOT NULL, PhoneNumber int NOT NULL, Email varchar(150), primary key	(id));
select * from Contacts;

#UC3 - Insert Contacts
insert into Contacts ( Name, Address, City, State, Zip, PhoneNumber, Email) VALUES ('Ashish Ware', 'Kurla', 'Mumbai', 'Maharashtra', 230532, 9865423, 'ashishWare@gmail.com'),('Jayesh Badalmia', 'Near Dadwadi', 'Jhalandar', 'Punjab', 230521, 2812512, 'ghanshyam@naukri.com'), ('Nikhil Sharma', 'matunga', 'Mumbai', 'Maharashtra', 400071, 9756365, 'NikhilSharma@gmail.com.com');
select * from Contacts;

#UC4 - Update Contact using Name
UPDATE Contacts SET Address = 'Ring Road' WHERE Name in('Ganshyam');
select * from Contacts;

#UC5 - Delete Contact using Name
delete from Contacts where Name in('Jayesh Badalmia');
select * from Contacts;

#UC6 - Retrieve all Contact using City or State name
select * from Contacts where City = 'Mumbai' or State = 'Maharashtra';

#UC7 - Count Contact in Address Book using City or State name
select count(city) from Contacts where City = 'Mumbai' or State = 'Maharashtra';

#UC8 - Sort Contacts by Person's name in given City or State
select * from Contacts where City = 'Mumbai' order by Name asc;

#UC9 - Ability to identify each Address Book with Address_Book_Name and Address_Book_Type
ALTER TABLE Contacts ADD address_book_name VARCHAR(50) NOT NULL AFTER Email;
ALTER TABLE Contacts ADD address_book_type VARCHAR(50) NOT NULL AFTER address_book_name;
SELECT * FROM Contacts;

UPDATE Contacts SET address_book_name = 'address_book_1' WHERE Name = 'Ashish Ware';
UPDATE Contacts SET address_book_name = 'address_book_2' WHERE Name = 'Nikhil Sharma';

UPDATE Contacts SET address_book_type = 'Family' WHERE address_book_name = 'address_book_1';
UPDATE Contacts SET address_book_type = 'Friend' WHERE address_book_name = 'address_book_2';										

SELECT * FROM Contacts;

#UC10 - Ability to get number of contact persons by type
SELECT address_book_type,COUNT(*) FROM Contacts WHERE address_book_type = 'Friend';
SELECT address_book_type,COUNT(*) FROM Contacts WHERE address_book_type = 'Family';




