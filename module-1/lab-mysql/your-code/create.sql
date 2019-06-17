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
-- Table `lab_mysql`.`Car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Car` (
  `ID` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `Manufacturer` VARCHAR(45) NULL,
  `Model` VARCHAR(45) NULL,
  `Year` YEAR(4) NULL,
  `Color` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Customer` (
  `ID` INT NOT NULL,
  `Customer ID` VARCHAR(45) NOT NULL,
  `Cust_Name` VARCHAR(45) NOT NULL,
  `Phone Number` VARCHAR(45) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Zip Code` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Salesperson` (
  `ID` INT NOT NULL,
  `Staff ID` VARCHAR(45) NOT NULL,
  `Sales_Name` VARCHAR(45) NOT NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`ID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoice` (
  `ID` INT NOT NULL,
  `Invoice Number` VARCHAR(45) NOT NULL,
  `Inv_Date` DATE NULL,
  `Salesperson_ID` INT NOT NULL,
  `Customer_ID` INT NOT NULL,
  `Car_ID` INT NOT NULL,
  PRIMARY KEY (`ID`, `Salesperson_ID`, `Customer_ID`, `Car_ID`),
  INDEX `fk_Invoice_Salesperson_idx` (`Salesperson_ID` ASC) VISIBLE,
  INDEX `fk_Invoice_Customer1_idx` (`Customer_ID` ASC) VISIBLE,
  INDEX `fk_Invoice_Car1_idx` (`Car_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Invoice_Salesperson`
    FOREIGN KEY (`Salesperson_ID`)
    REFERENCES `lab_mysql`.`Salesperson` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Customer1`
    FOREIGN KEY (`Customer_ID`)
    REFERENCES `lab_mysql`.`Customer` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoice_Car1`
    FOREIGN KEY (`Car_ID`)
    REFERENCES `lab_mysql`.`Car` (`ID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
