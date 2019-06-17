CREATE DATABASE lab_mysql;

USE lab_mysql;

CREATE TABLE  IF NOT EXISTS CARS (ID VARCHAR(4) NOT NULL, VIN VARCHAR(25) NOT NULL,
Manufacturer VARCHAR(25) NOT NULL, Model VARCHAR(30) NOT NULL, 
Myear YEAR NOT NULL, Color VARCHAR (15) NOT NULL, PRIMARY KEY (ID)) ENGINE = InnoDB;

CREATE TABLE  IF NOT EXISTS CUSTOMERS (ID VARCHAR(4) NOT NULL, Customer_ID VARCHAR(10) NOT NULL,
Full_name VARCHAR(80) NOT NULL, Phone VARCHAR(20) NOT NULL, Email VARCHAR(60), 
Address VARCHAR(60) NOT NULL, City VARCHAR(30) NOT NULL, 
State_Province VARCHAR(40) NOT NULL, Country VARCHAR(40) NOT NULL, 
Postal_Code VARCHAR(10) NOT NULL, PRIMARY KEY (ID)) ENGINE = InnoDB;

CREATE TABLE  IF NOT EXISTS SALESPERSONS (ID VARCHAR(4) NOT NULL, STAFF_ID VARCHAR(20) NOT NULL,
EE_NAME VARCHAR(80) NOT NULL, STORE VARCHAR(40) NOT NULL, PRIMARY KEY (ID)) ENGINE = InnoDB;

CREATE TABLE  IF NOT EXISTS INVOICES (ID VARCHAR(4) NOT NULL, INVOICE_NUMBER VARCHAR(20) NOT NULL,
INV_DATE DATE NOT NULL, PRIMARY KEY (ID)) ENGINE = InnoDB;


-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET latin1 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`CARS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`CARS` (
  `ID` VARCHAR(4) NOT NULL,
  `VIN` VARCHAR(25) NOT NULL,
  `Manufacturer` VARCHAR(25) NOT NULL,
  `Model` VARCHAR(30) NOT NULL,
  `Myear` YEAR NOT NULL,
  `Color` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lab_mysql`.`CUSTOMERS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`CUSTOMERS` (
  `ID` VARCHAR(4) NOT NULL,
  `Customer_ID` VARCHAR(10) NOT NULL,
  `Full_name` VARCHAR(80) NOT NULL,
  `Phone` VARCHAR(20) NOT NULL,
  `Email` VARCHAR(60) NULL DEFAULT NULL,
  `Address` VARCHAR(60) NOT NULL,
  `City` VARCHAR(30) NOT NULL,
  `State_Province` VARCHAR(40) NOT NULL,
  `Country` VARCHAR(40) NOT NULL,
  `Postal_Code` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lab_mysql`.`SALESPERSONS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`SALESPERSONS` (
  `ID` VARCHAR(4) NOT NULL,
  `STAFF_ID` VARCHAR(20) NOT NULL,
  `EE_NAME` VARCHAR(80) NOT NULL,
  `STORE` VARCHAR(40) NOT NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `lab_mysql`.`INVOICES`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`INVOICES` (
  `ID` VARCHAR(4) NOT NULL,
  `INVOICE_NUMBER` VARCHAR(20) NOT NULL,
  `INV_DATE` DATE NOT NULL,
  `SALESPERSONS_ID` VARCHAR(4) NOT NULL,
  `CARS_ID` VARCHAR(4) NOT NULL,
  `CUSTOMERS_ID` VARCHAR(4) NOT NULL,
  PRIMARY KEY (`ID`),
  INDEX `fk_INVOICES_SALESPERSONS_idx` (`SALESPERSONS_ID` ASC),
  INDEX `fk_INVOICES_CARS1_idx` (`CARS_ID` ASC),
  INDEX `fk_INVOICES_CUSTOMERS1_idx` (`CUSTOMERS_ID` ASC),
  CONSTRAINT `fk_INVOICES_SALESPERSONS`
    FOREIGN KEY (`SALESPERSONS_ID`)
    REFERENCES `lab_mysql`.`SALESPERSONS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INVOICES_CARS1`
    FOREIGN KEY (`CARS_ID`)
    REFERENCES `lab_mysql`.`CARS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INVOICES_CUSTOMERS1`
    FOREIGN KEY (`CUSTOMERS_ID`)
    REFERENCES `lab_mysql`.`CUSTOMERS` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
