-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema agenda_contact
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `agenda_contact` ;

-- -----------------------------------------------------
-- Schema agenda_contact
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `agenda_contact` ;
USE `agenda_contact` ;

-- -----------------------------------------------------
-- Table `societes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `societes` ;

CREATE TABLE IF NOT EXISTS `societes` (
  `rs` VARCHAR(45) NOT NULL,
  `ss` VARCHAR(45) NOT NULL,
  `fax` VARCHAR(10) BINARY NULL,
  `rib` VARCHAR(45) BINARY NULL,
  PRIMARY KEY (`rs`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `departements`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `departements` ;

CREATE TABLE IF NOT EXISTS `departements` (
  `nom_dep` VARCHAR(45) NOT NULL,
  `fonction` VARCHAR(45) NOT NULL,
  `phone` VARCHAR(45) NULL,
  `adresse` VARCHAR(200) NULL,
  PRIMARY KEY (`nom_dep`))
ENGINE = InnoDB;

CREATE UNIQUE INDEX `phone_UNIQUE` ON `departements` (`phone` ASC) VISIBLE;


-- -----------------------------------------------------
-- Table `contacts`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `contacts` ;

CREATE TABLE IF NOT EXISTS `contacts` (
  `idcontacts` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(45) NOT NULL,
  `gsm` CHAR(10) NULL,
  `rs` VARCHAR(45) NOT NULL,
  `nom_dep` VARCHAR(45) NOT NULL,
  `photo` VARCHAR(45) NULL,
  PRIMARY KEY (`idcontacts`),
  CONSTRAINT `fk_contacts_societes`
    FOREIGN KEY (`rs`)
    REFERENCES `societes` (`rs`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_contacts_departements1`
    FOREIGN KEY (`nom_dep`)
    REFERENCES `departements` (`nom_dep`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE UNIQUE INDEX `gsm_UNIQUE` ON `contacts` (`gsm` ASC) VISIBLE;

CREATE INDEX `fk_contacts_societes_idx` ON `contacts` (`rs` ASC) VISIBLE;

CREATE INDEX `fk_contacts_departements1_idx` ON `contacts` (`nom_dep` ASC) VISIBLE;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
