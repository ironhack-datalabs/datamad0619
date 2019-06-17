-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Cars`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cars` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(60) NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` VARCHAR(45) NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Customers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Customers` (
  `ID` INT NOT NULL,
  `ID_customer` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Phone number` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/Province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Zip code` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Salespersons`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Salespersons` (
  `ID` INT NOT NULL,
  `Staff ID` VARCHAR(45) NULL,
  `Name` VARCHAR(45) NULL,
  `Company store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Invoices` (
  `ID` INT NOT NULL,
  `Invoice number` VARCHAR(45) NULL,
  `Date` DATETIME NULL,
  `Customers_ID` VARCHAR(45) NOT NULL,
  `Salespersons_ID` VARCHAR(45) NOT NULL,
  `Cars_ID` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Customers_ID`, `Salespersons_ID`, `Cars_ID`, `ID`),
  INDEX `fk_Invoices_Customers_idx` (`Customers_ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons_ID` ASC) VISIBLE,
  INDEX `fk_Invoices_Cars1_idx` (`Cars_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoices_Customers`
    FOREIGN KEY (`Customers_ID`)
    REFERENCES `mydb`.`Customers` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons_ID`)
    REFERENCES `mydb`.`Salespersons` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Cars1`
    FOREIGN KEY (`Cars_ID`)
    REFERENCES `mydb`.`Cars` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
