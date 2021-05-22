-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema company
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `company` DEFAULT CHARACTER SET utf8mb4 ;
USE `company` ;

-- -----------------------------------------------------
-- Table `company`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`client` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `surname` VARCHAR(45) NOT NULL,
  `dni` VARCHAR(12) NOT NULL,
  `birthday` DATE NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `dni_UNIQUE` (`dni` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`supplier`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`supplier` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `nif` VARCHAR(12) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `address` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`product` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `code` INT NOT NULL,
  `price` DECIMAL(10,2) UNSIGNED NOT NULL,
  `supplier_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `id_UNIQUE` (`id` ASC) VISIBLE,
  UNIQUE INDEX `code_UNIQUE` (`code` ASC) VISIBLE,
  INDEX `fk_product_supplier1_idx` (`supplier_id` ASC) VISIBLE,
  CONSTRAINT `fk_product_supplier1`
    FOREIGN KEY (`supplier_id`)
    REFERENCES `company`.`supplier` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `company`.`client_has_product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `company`.`client_has_product` (
  `client_id` INT UNSIGNED NOT NULL,
  `product_id` INT UNSIGNED NOT NULL,
  PRIMARY KEY (`client_id`, `product_id`),
  INDEX `fk_client_has_product_product1_idx` (`product_id` ASC) VISIBLE,
  INDEX `fk_client_has_product_client_idx` (`client_id` ASC) VISIBLE,
  CONSTRAINT `fk_client_has_product_client`
    FOREIGN KEY (`client_id`)
    REFERENCES `company`.`client` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_client_has_product_product1`
    FOREIGN KEY (`product_id`)
    REFERENCES `company`.`product` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
