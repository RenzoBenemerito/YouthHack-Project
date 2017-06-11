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
CREATE SCHEMA IF NOT EXISTS `seekdb` DEFAULT CHARACTER SET latin1 ;
USE `seekdb` ;

-- -----------------------------------------------------
-- Table `seekdb`.`user_account`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seekdb`.`user_account` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `user_username` VARCHAR(45) NULL DEFAULT NULL,
  `user_password` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `user_username_UNIQUE` (`user_username` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `seekdb`.`user_organizations`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seekdb`.`user_organizations` (
  `user_account_user_id` INT(11) NOT NULL,
  `organization_name` VARCHAR(45) NULL DEFAULT NULL,
  `contact_number` VARCHAR(45) NULL DEFAULT NULL,
  `representative` VARCHAR(100) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  INDEX `fk_user_organizations_user_account1_idx` (`user_account_user_id` ASC),
  CONSTRAINT `fk_user_organizations_user_account1`
    FOREIGN KEY (`user_account_user_id`)
    REFERENCES `seekdb`.`user_account` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


-- -----------------------------------------------------
-- Table `seekdb`.`speaker_category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seekdb`.`speaker_category` (
  `category_id` INT NOT NULL,
  `category` VARCHAR(45) NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `category_UNIQUE` (`category` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `seekdb`.`user_speakers`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `seekdb`.`user_speakers` (
  `user_id` INT(11) NOT NULL,
  `first_name` VARCHAR(45) NULL DEFAULT NULL,
  `last_name` VARCHAR(45) NULL DEFAULT NULL,
  `age` INT(11) NULL DEFAULT NULL,
  `job_title` VARCHAR(45) NULL DEFAULT NULL,
  `contact_number` VARCHAR(45) NULL DEFAULT NULL,
  `email` VARCHAR(45) NULL DEFAULT NULL,
  `speaker_category_id` INT NOT NULL,
  INDEX `fk_user_speakers_user_account_idx` (`user_id` ASC),
  INDEX `fk_user_speakers_speaker_category1_idx` (`speaker_category_id` ASC),
  CONSTRAINT `fk_user_speakers_user_account`
    FOREIGN KEY (`user_id`)
    REFERENCES `seekdb`.`user_account` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_user_speakers_speaker_category1`
    FOREIGN KEY (`speaker_category_id`)
    REFERENCES `seekdb`.`speaker_category` (`category_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = latin1;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
