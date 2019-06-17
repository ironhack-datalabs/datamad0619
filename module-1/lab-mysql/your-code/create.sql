SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

CREATE SCHEMA IF NOT EXISTS `mysql_lab` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci ;
USE `mysql_lab` ;

-- -----------------------------------------------------
-- Table `mysql_lab`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_lab`.`Cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(45) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` YEAR NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysql_lab`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_lab`.`Customers` (
  `ID` INT NOT NULL,
  `CustomerID` VARCHAR(5) NULL,
  `Name` VARCHAR(45) NULL,
  `Phone` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Postal` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysql_lab`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_lab`.`Salespersons` (
  `ID` INT NOT NULL,
  `StaffID` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mysql_lab`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mysql_lab`.`Invoices` (
  `ID` INT NOT NULL,
  `InvoiceNumber` VARCHAR(45) NULL,
  `Date` VARCHAR(45) NULL,
  `Cars_ID` INT NOT NULL,
  `Salespersons_ID` INT NOT NULL,
  `CustomersID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Cars_ID`, `Salespersons_ID`, `CustomersID`),
  INDEX `fk_Invoices_Cars_idx` (`Cars_ID` ASC),
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_ID` ASC),
  INDEX `fk_Invoices_Customers1_idx` (`CustomersID` ASC),
  CONSTRAINT `fk_Invoices_Cars`
    FOREIGN KEY (`Cars_ID`)
    REFERENCES `mysql_lab`.`Cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_ID`)
    REFERENCES `mysql_lab`.`Salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Customers1`
    FOREIGN KEY (`CustomersID`)
    REFERENCES `mysql_lab`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
