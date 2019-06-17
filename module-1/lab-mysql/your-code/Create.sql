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
-- Table `mydb`.`CUSTOMER`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CUSTOMER` (
  `id` INT NOT NULL,
  `NAME` VARCHAR(45) NULL,
  `PHONE` INT NULL,
  `EMAIL` VARCHAR(45) NULL,
  `ADDRESS` VARCHAR(45) NULL,
  `CITY` VARCHAR(45) NULL,
  `STATE` VARCHAR(45) NULL,
  `COUNTRY` VARCHAR(45) NULL,
  `POSTAL_CODE` INT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`SALESPERSON`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SALESPERSON` (
  `idSALESPERSON` INT NOT NULL,
  `NAME` VARCHAR(45) NULL,
  `STORE` VARCHAR(45) NULL,
  PRIMARY KEY (`idSALESPERSON`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`INVOICE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`INVOICE` (
  `idINVOICE` INT NOT NULL,
  `DATE` DATETIME NULL,
  `CUSTOMER_id` INT NOT NULL,
  `SALESPERSON_idSALESPERSON` INT NOT NULL,
  PRIMARY KEY (`idINVOICE`),
  INDEX `fk_INVOICE_CUSTOMER1_idx` (`CUSTOMER_id` ASC) VISIBLE,
  INDEX `fk_INVOICE_SALESPERSON1_idx` (`SALESPERSON_idSALESPERSON` ASC) VISIBLE,
  CONSTRAINT `fk_INVOICE_CUSTOMER1`
    FOREIGN KEY (`CUSTOMER_id`)
    REFERENCES `mydb`.`CUSTOMER` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_INVOICE_SALESPERSON1`
    FOREIGN KEY (`SALESPERSON_idSALESPERSON`)
    REFERENCES `mydb`.`SALESPERSON` (`idSALESPERSON`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`CAR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`CAR` (
  `idCAR` INT NOT NULL,
  `VIN` VARCHAR(45) NOT NULL,
  `MANUFACTURER` VARCHAR(45) NULL,
  `MODEL` VARCHAR(45) NULL,
  `YEAR` INT NULL,
  `COLOR` VARCHAR(45) NULL,
  `INVOICE_idINVOICE` INT NOT NULL,
  PRIMARY KEY (`idCAR`, `VIN`),
  INDEX `fk_CAR_INVOICE1_idx` (`INVOICE_idINVOICE` ASC) VISIBLE,
  CONSTRAINT `fk_CAR_INVOICE1`
    FOREIGN KEY (`INVOICE_idINVOICE`)
    REFERENCES `mydb`.`INVOICE` (`idINVOICE`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
