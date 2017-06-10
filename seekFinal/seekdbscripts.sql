-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema seekdb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema seekdb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `seekdb` DEFAULT CHARACTER SET utf8 ;
USE `seekdb` ;

-- -----------------------------------------------------
-- Table `seekdb`.`user_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seekdb`.`user_account` (
  `user_id` INT NOT NULL AUTO_INCREMENT,
  `user_username` VARCHAR(45) NULL,
  `user_password` VARCHAR(45) NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_username_UNIQUE` (`user_username` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seekdb`.`user_speakers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seekdb`.`user_speakers` (
  `user_id` INT NOT NULL,
  `first_name` VARCHAR(45) NULL,
  `last_name` VARCHAR(45) NULL,
  `age` INT NULL,
  `job_title` VARCHAR(45) NULL,
  `contact_number` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  INDEX `fk_user_speakers_user_account_idx` (`user_id` ASC),
  CONSTRAINT `fk_user_speakers_user_account`
    FOREIGN KEY (`user_id`)
    REFERENCES `seekdb`.`user_account` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seekdb`.`user_organizations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seekdb`.`user_organizations` (
  `user_account_user_id` INT NOT NULL,
  `organization_name` VARCHAR(45) NULL,
  `contact_number` VARCHAR(45) NULL,
  `representative` VARCHAR(100) NULL,
  `email` VARCHAR(45) NULL,
  INDEX `fk_user_organizations_user_account1_idx` (`user_account_user_id` ASC),
  CONSTRAINT `fk_user_organizations_user_account1`
    FOREIGN KEY (`user_account_user_id`)
    REFERENCES `seekdb`.`user_account` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
