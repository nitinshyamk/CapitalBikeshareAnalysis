CREATE SCHEMA `cbikeshare` ;

CREATE TABLE `cbikeshare`.`rides` (
  `startTime` DATETIME NOT NULL,
  `endTime` DATETIME NOT NULL,
  `startStation` INT NOT NULL,
  `endStation` INT NOT NULL,
  `bikeId` VARCHAR(12) NOT NULL,
  `membershipType` VARCHAR(20) NOT NULL);


CREATE TABLE `cbikeshare`.`stations` (
  `stationId` INT NOT NULL,
  `latitude` DECIMAL(12) NOT NULL,
  `longitude` DECIMAL(12) NOT NULL,
  `address` VARCHAR(45) NULL,
  `numberOfDocks` INT NULL,
  PRIMARY KEY (`stationId`));