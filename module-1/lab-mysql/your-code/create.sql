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
CREATE SCHEMA IF NOT EXISTS `lab_mysql` ;
USE `lab_mysql` ;

-- -----------------------------------------------------
-- Table `lab_mysql`.`car`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`car` (
  `idcar` INT NOT NULL AUTO_INCREMENT,
  `VIN` VARCHAR(45) NOT NULL,
  `manufacturer` VARCHAR(45) NOT NULL,
  `model` VARCHAR(45) NOT NULL,
  `year` INT NOT NULL,
  `color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idcar`),
  UNIQUE INDEX `idcar_UNIQUE` (`idcar` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lab_mysql`.`customer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`customer` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `customer_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NULL,
  `address` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `country` VARCHAR(45) NOT NULL,
  `zip` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `customer_id_UNIQUE` (`customer_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lab_mysql`.`salesperson`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`salesperson` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `staff_id` INT NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `store` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `staff_id_UNIQUE` (`staff_id` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


-- -----------------------------------------------------
-- Table `lab_mysql`.`invoice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `lab_mysql`.`invoice` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `invoice_number` INT NOT NULL,
  `date` DATE NOT NULL,
  `car_idcar` INT NOT NULL,
  `salesperson_id` INT NOT NULL,
  `customer_id` INT NOT NULL,
  PRIMARY KEY (`id`, `car_idcar`, `salesperson_id`, `customer_id`),
  INDEX `fk_invoice_car_idx` (`car_idcar` ASC),
  INDEX `fk_invoice_salesperson1_idx` (`salesperson_id` ASC),
  INDEX `fk_invoice_customer1_idx` (`customer_id` ASC),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC),
  UNIQUE INDEX `invoice_number_UNIQUE` (`invoice_number` ASC),
  CONSTRAINT `fk_invoice_car`
    FOREIGN KEY (`car_idcar`)
    REFERENCES `lab_mysql`.`car` (`idcar`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_salesperson1`
    FOREIGN KEY (`salesperson_id`)
    REFERENCES `lab_mysql`.`salesperson` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_invoice_customer1`
    FOREIGN KEY (`customer_id`)
    REFERENCES `lab_mysql`.`customer` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

