-- MySQL Workbench Synchronization
-- Generated: 2019-06-17 21:35
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: fserrey

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

ALTER TABLE `lab-mysql`.`car` 
ADD COLUMN `invoice_idinvoice` INT(11) NOT NULL AFTER `year`,
CHANGE COLUMN `color` `idcar` TEXT(10) NOT NULL FIRST,
CHANGE COLUMN `vin` `vin` VARCHAR(25) NULL DEFAULT NULL ,
CHANGE COLUMN `model` `model` VARCHAR(15) NULL DEFAULT NULL ,
DROP PRIMARY KEY,
ADD PRIMARY KEY (`idcar`),
ADD INDEX `fk_car_invoice_idx` (`invoice_idinvoice` ASC);
;

CREATE TABLE IF NOT EXISTS `lab-mysql`.`customer` (
  `idcustomer` INT(11) NOT NULL,
  `name` VARCHAR(30) NULL DEFAULT NULL,
  `phone` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `city` TEXT(10) NULL DEFAULT NULL,
  `state/province` VARCHAR(20) NULL DEFAULT NULL,
  `country` TEXT(20) NULL DEFAULT NULL,
  `postal` INT(11) NULL DEFAULT NULL,
  PRIMARY KEY (`idcustomer`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;

ALTER TABLE `lab-mysql`.`invoice` 
DROP COLUMN `car_vin`,
DROP COLUMN `staffid`,
DROP COLUMN `customer`,
DROP COLUMN `car`,
ADD COLUMN `customer_idcustomer` INT(11) NOT NULL AFTER `date`,
ADD COLUMN `salesperson_staffid` INT(11) NOT NULL AFTER `customer_idcustomer`,
ADD INDEX `fk_invoice_customer1_idx` (`customer_idcustomer` ASC),
ADD INDEX `fk_invoice_salesperson1_idx` (`salesperson_staffid` ASC),
DROP INDEX `fk_invoice_car1_idx` ;
;

ALTER TABLE `lab-mysql`.`salesperson` 
DROP COLUMN `car_vin`,
DROP COLUMN `customer_idcustomer`,
DROP INDEX `fk_salesperson_car1_idx` ,
DROP INDEX `fk_salesperson_customer1_idx` ;
;

ALTER TABLE `lab-mysql`.`salesperson_has_invoice` 
DROP INDEX `fk_salesperson_has_invoice_salesperson1_idx` ,
DROP INDEX `fk_salesperson_has_invoice_invoice1_idx` ,
DROP PRIMARY KEY;
;

ALTER TABLE `lab-mysql`.`car` 
ADD CONSTRAINT `fk_car_invoice`
  FOREIGN KEY (`invoice_idinvoice`)
  REFERENCES `lab-mysql`.`invoice` (`idinvoice`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;

ALTER TABLE `lab-mysql`.`invoice` 
ADD CONSTRAINT `fk_invoice_customer1`
  FOREIGN KEY (`customer_idcustomer`)
  REFERENCES `lab-mysql`.`customer` (`idcustomer`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION,
ADD CONSTRAINT `fk_invoice_salesperson1`
  FOREIGN KEY (`salesperson_staffid`)
  REFERENCES `lab-mysql`.`salesperson` (`staffid`)
  ON DELETE NO ACTION
  ON UPDATE NO ACTION;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
