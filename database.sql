CREATE DATABASE HopeTrack;
DROP DATABASE HopeTrack;

Use HopeTrack;

CREATE TABLE Donator (
id int PRIMARY KEY auto_increment,
name VARCHAR(30) NOT NULL,
email VARCHAR(20) UNIQUE NOT NULL
);

SELECT * FROM Donator;

CREATE TABLE Donation(
id int primary key auto_increment,
amount DOUBLE PRECISION NOT NULL,
donation_date DATE NOT NULL,
payment_receipt_link VARCHAR(78),
donator_id INT,
FOREIGN KEY (donator_id) REFERENCES Donator(id) ON DELETE CASCADE ON UPDATE CASCADE
);


CREATE TABLE Charity(
id int primary key auto_increment,
name varchar(30) UNIQUE NOT NULL,
description TEXT NOT NULL,
identification CHAR(14) NOT NULL
);

CREATE TABLE Donator_Charity(
donator_id INT,
charity_id INT,
PRIMARY KEY(donator_id,charity_id), 
FOREIGN KEY  (donator_id) REFERENCES Donator(id) ON DELETE CASCADE ON UPDATE CASCADE,
FOREIGN KEY (Charity_id) REFERENCES Charity(id) ON DELETE CASCADE ON UPDATE CASCADE 
)
