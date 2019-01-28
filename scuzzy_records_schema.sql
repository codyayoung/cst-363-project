-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Scuzzy_Records
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Scuzzy_Records
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Scuzzy_Records` DEFAULT CHARACTER SET utf8 ;
USE `Scuzzy_Records` ;

-- -----------------------------------------------------
-- Table `Scuzzy_Records`.`genres`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Scuzzy_Records`.`genres` (
  `genre_id` INT NOT NULL,
  `genre_name` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`genre_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Scuzzy_Records`.`artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Scuzzy_Records`.`artists` (
  `artist_id` INT NOT NULL,
  `artist_name` VARCHAR(45) NOT NULL,
  `artist_genre_id` INT NOT NULL,
  PRIMARY KEY (`artist_id`),
  INDEX `genre_id_idx` (`artist_genre_id` ASC) VISIBLE,
  CONSTRAINT `genre_id`
    FOREIGN KEY (`artist_genre_id`)
    REFERENCES `Scuzzy_Records`.`genres` (`genre_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Scuzzy_Records`.`record_sales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Scuzzy_Records`.`record_sales` (
  `sales_id` INT NOT NULL,
  `artist_id` INT NOT NULL,
  `sales_date` DATETIME NOT NULL,
  `sales_total` DECIMAL(9,2) NOT NULL,
  `sales_city` VARCHAR(45) NOT NULL,
  `sales_state` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`sales_id`),
  INDEX `artist_id_idx` (`artist_id` ASC) VISIBLE,
  CONSTRAINT `artist_id`
    FOREIGN KEY (`artist_id`)
    REFERENCES `Scuzzy_Records`.`artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Scuzzy_Records`.`venues`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Scuzzy_Records`.`venues` (
  `venue_id` INT NOT NULL,
  `venue_city` VARCHAR(45) NOT NULL,
  `venue_state` VARCHAR(45) NOT NULL,
  `venue_capacity` INT NOT NULL,
  `venue_cost` DECIMAL(9,2) NOT NULL,
  PRIMARY KEY (`venue_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Scuzzy_Records`.`performances`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Scuzzy_Records`.`performances` (
  `performance_id` INT NOT NULL,
  `performance_name` VARCHAR(45) NOT NULL,
  `performing_artist_id` INT NOT NULL,
  `performance_cost` DECIMAL(9,2) NOT NULL,
  `performance_date` DATETIME NOT NULL,
  `venue_id` INT NOT NULL,
  PRIMARY KEY (`performance_id`),
  INDEX `venue_id_idx` (`venue_id` ASC) VISIBLE,
  INDEX `performing_artist_id_idx` (`performing_artist_id` ASC) VISIBLE,
  CONSTRAINT `venue_id`
    FOREIGN KEY (`venue_id`)
    REFERENCES `Scuzzy_Records`.`venues` (`venue_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `performing_artist_id`
    FOREIGN KEY (`performing_artist_id`)
    REFERENCES `Scuzzy_Records`.`artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
