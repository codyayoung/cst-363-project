-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Scuzzy_Records_Data_Warehouse
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Scuzzy_Records_Data_Warehouse
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Scuzzy_Records_Data_Warehouse` DEFAULT CHARACTER SET utf8 ;
USE `Scuzzy_Records_Data_Warehouse` ;

-- -----------------------------------------------------
-- Table `Scuzzy_Records_Data_Warehouse`.`Dim_Artists`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Scuzzy_Records_Data_Warehouse`.`Dim_Artists` (
  `artist_id` INT NOT NULL AUTO_INCREMENT,
  `artist_name` VARCHAR(45) NOT NULL,
  `artist_genre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`artist_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Scuzzy_Records_Data_Warehouse`.`Dim_Events`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Scuzzy_Records_Data_Warehouse`.`Dim_Events` (
  `event_id` INT NOT NULL AUTO_INCREMENT,
  `event_type` VARCHAR(45) NOT NULL,
  `city` VARCHAR(45) NOT NULL,
  `state` VARCHAR(45) NOT NULL,
  `event_date` DATETIME NOT NULL,
  PRIMARY KEY (`event_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Scuzzy_Records_Data_Warehouse`.`Fact_Artist_Stat`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Scuzzy_Records_Data_Warehouse`.`Fact_Artist_Stat` (
  `artist_id` INT NOT NULL,
  `event_id` INT NOT NULL,
  `cost` DECIMAL(9,2) NOT NULL,
  `amount` DECIMAL(9,2) NOT NULL,
  `total` DECIMAL(9,2) NOT NULL,
  INDEX `artist_id_idx` (`artist_id` ASC) VISIBLE,
  INDEX `event_id_idx` (`event_id` ASC) VISIBLE,
  CONSTRAINT `artist_id`
    FOREIGN KEY (`artist_id`)
    REFERENCES `Scuzzy_Records_Data_Warehouse`.`Dim_Artists` (`artist_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `event_id`
    FOREIGN KEY (`event_id`)
    REFERENCES `Scuzzy_Records_Data_Warehouse`.`Dim_Events` (`event_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
