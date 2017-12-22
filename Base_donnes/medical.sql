-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`infirmiere`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`infirmiere` (
  `idinfirmiere` INT NOT NULL,
  `numprofesionel` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `adresse` VARCHAR(45) NOT NULL,
  `telVoiture` INT NOT NULL,
  `telDomicile` INT NOT NULL,
  PRIMARY KEY (`idinfirmiere`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`deplacement`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`deplacement` (
  `iddeplacement` INT NOT NULL,
  `date` DATE NOT NULL,
  `cout` INT NOT NULL,
  `infirmiere_idinfirmiere` INT NOT NULL,
  PRIMARY KEY (`iddeplacement`),
  INDEX `fk_deplacement_infirmiere1_idx` (`infirmiere_idinfirmiere` ASC),
  CONSTRAINT `fk_deplacement_infirmiere1`
    FOREIGN KEY (`infirmiere_idinfirmiere`)
    REFERENCES `mydb`.`infirmiere` (`idinfirmiere`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Patient`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Patient` (
  `idPatient` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `prenom` VARCHAR(45) NOT NULL,
  `dateNassance` DATE NOT NULL,
  `sexe` VARCHAR(45) NOT NULL,
  `adresse` VARCHAR(45) NOT NULL,
  `numSecurite` VARCHAR(30) NOT NULL,
  `infirmiere_idinfirmiere` INT NOT NULL,
  `deplacement_iddeplacement` INT NOT NULL,
  PRIMARY KEY (`idPatient`, `infirmiere_idinfirmiere`, `deplacement_iddeplacement`),
  INDEX `fk_Patient_infirmiere_idx` (`infirmiere_idinfirmiere` ASC),
  INDEX `fk_Patient_deplacement1_idx` (`deplacement_iddeplacement` ASC),
  CONSTRAINT `fk_Patient_infirmiere`
    FOREIGN KEY (`infirmiere_idinfirmiere`)
    REFERENCES `mydb`.`infirmiere` (`idinfirmiere`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Patient_deplacement1`
    FOREIGN KEY (`deplacement_iddeplacement`)
    REFERENCES `mydb`.`deplacement` (`iddeplacement`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
