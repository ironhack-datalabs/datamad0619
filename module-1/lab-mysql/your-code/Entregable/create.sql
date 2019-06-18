
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema lab_mysql\
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema lab_mysql\
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `lab_mysql` DEFAULT CHARACTER SET utf8 ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`Cars`\
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Cars` (
  `idCars` INT NOT NULL,
  `vehicle identification number` VARCHAR(60) NULL,
  `manufacturer` VARCHAR(45) NULL,
  `model` VARCHAR(45) NULL,
  `year` INT NULL,
  `color` VARCHAR(45) NULL,
  PRIMARY KEY (`idCars`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Costumers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Costumers` (
  `idCostumers` INT NOT NULL,
  `The customer ID` INT NULL,
  `Name` VARCHAR(45) NULL,
  `Phone number` VARCHAR(60) NULL,
  `Email` VARCHAR(45) NULL,
  `Address` VARCHAR(45) NULL,
  `City` VARCHAR(45) NULL,
  `State/Province` VARCHAR(45) NULL,
  `Country` VARCHAR(45) NULL,
  `Postal` VARCHAR(45) NULL,
  PRIMARY KEY (`idCostumers`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Salespersons`\
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Salespersons` (
  `idSalespersons` INT NOT NULL,
  `Staff ID` INT NOT NULL,
  `Name` VARCHAR(45) NULL,
  `Store` VARCHAR(45) NULL,
  PRIMARY KEY (`idSalespersons`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `lab_mysql`.`Invoices`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`Invoices` (
  `idInvoices` INT NOT NULL,
  `Invoice Number` INT NOT NULL,
  `Date` DATE NULL,
  `Cars_id` INT NULL,
  `Costumers_id` INT NULL,
  `Salespersons ID` INT NOT NULL,
  PRIMARY KEY (`idInvoices`),
  INDEX `fk_Invoices_Cars_idx` (`Cars_id` ASC),
  INDEX `fk_Invoices_Costumers1_idx` (`Costumers_id` ASC),
  INDEX `fk_Invoices_Salespersons1_idx` (`Salespersons ID` ASC),
  CONSTRAINT `fk_Invoices_Cars`
    FOREIGN KEY (`Cars_id`)
    REFERENCES `lab_mysql`.`Cars` (`idCars`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Costumers1`
    FOREIGN KEY (`Costumers_id`)
    REFERENCES `lab_mysql`.`Costumers` (`idCostumers`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Invoices_Salespersons1`
    FOREIGN KEY (`Salespersons ID`)
    REFERENCES `lab_mysql`.`Salespersons` (`idSalespersons`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;