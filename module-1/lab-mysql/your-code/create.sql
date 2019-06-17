-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Cars` (
  `VIN` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`VIN`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customers` (
  `idCustomer` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `phone_num` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  `adress` VARCHAR(45) NULL,
  `city` VARCHAR(45) NULL,
  `state/province` VARCHAR(45) NULL,
  `country` VARCHAR(45) NULL,
  `zip/postal_code` VARCHAR(45) NULL,
  PRIMARY KEY (`idCustomer`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Sales_person`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Sales_person` (
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NULL,
  `store` VARCHAR(45) NULL,
  PRIMARY KEY (`staff_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoices` (
  `invoice_num` INT NOT NULL,
  `date` DATETIME NULL,
  `Sales_person_staff_id` INT NOT NULL,
  `Customers_idCustomer` INT NOT NULL,
  `Cars_VIN` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`invoice_num`, `Sales_person_staff_id`, `Customers_idCustomer`, `Cars_VIN`),
  INDEX `fk_Invoices_Sales_person_idx` (`Sales_person_staff_id` ASC) VISIBLE,
  INDEX `fk_Invoices_Customers1_idx` (`Customers_idCustomer` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`Cars_VIN` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Sales_person`
    FOREIGN KEY (`Sales_person_staff_id`)
    REFERENCES `lab_mysql`.`Sales_person` (`staff_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`Customers_idCustomer`)
    REFERENCES `lab_mysql`.`Customers` (`idCustomer`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_VIN`)
    REFERENCES `lab_mysql`.`Cars` (`VIN`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
