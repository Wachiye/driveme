-- USERS TABLE
CREATE TABLE IF NOT EXISTS `users`(
	userId varchar(37) primary key,
    firstName varchar(15) not null,
    lastName varchar(15) not null,
    username varchar(15) not null unique,
    email varchar(100) not null unique,
    password char(64) not null
);

-- USERS DUMMY DATA
INSERT INTO users(userId, firstName, lastName,username, email, password, userType)
VALUES('5e1b5a8b-c63f-4511-bdc7-434b02403543','Wachiye','Siranjofu','Siranjofu','siranjofuw@gmail.com','2345','driver'),
('5e1b5a8b-c63f-4511-bdc7-434b02403544','Wachiye','Jeremiah','Jerry','siranjofuw1@gmail.com','2345','admin'),
('5e1b5a8b-c63f-4511-bdc7-434b02403545','Siranjofu','Wachiye','Sirah','siranjofuw2@gmail.com','2345','client');

-- MESSAGES TABLE
CREATE TABLE IF NOT EXISTS `messages`(
	messageId varchar(37) primary key,
    firstName varchar(15) not null,
    lastName varchar(15) not null,
    email varchar(100) not null unique,
    message text not null,
   status varchar(15) not null default 'unread'
);

-- ORDERS TABLE
CREATE TABLE IF NOT EXISTS `orders`(
	orderId varchar(37) primary key,
    clientId varchar(37) references users(userId),
    title varchar(100) not null,
    shortDescription varchar(300) not null,
    longDescription text,
    expertise enum('expert','proficient','competent','biginner','any') default 'any',
    vehicleType varchar(100) not null,
    experience int not null default 0,
    ageRange varchar(8),
    pay double not null default 1.00,
    uploadDate datetime not null default current_timestamp,
    deadline datetime,
    status varchar(15) not null default 'active'
);

-- BIDS TABLE
CREATE TABLE IF NOT EXISTS `bids`(
	bidId varchar(37) primary key,
    driverId varchar(37) references users(userId),
    orderId varchar(37) references orders(orderId),
    profile varchar(400) not null,
    bidDate datetime not null default current_timestamp,
     status varchar(15) not null default 'pending',
     closureDate datetime
);