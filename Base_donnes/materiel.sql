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
-- Table `mydb`.`Categorie`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Categorie` (
  `idCategorie` INT NOT NULL,
  `Mi` VARCHAR(2) NOT NULL,
  `Oi` VARCHAR(2) NOT NULL,
  `Mb` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idCategorie`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`materiel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`materiel` (
  `idmateriel` INT NOT NULL,
  `referenceinterne` VARCHAR(45) NOT NULL,
  `deseignation` VARCHAR(45) NOT NULL,
  `dateAchat` DATETIME NOT NULL,
  `prixlocation` INT NOT NULL,
  ` categorie` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idmateriel`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`adresse`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`adresse` (
  `idadresse` INT NOT NULL,
  `numero` INT NOT NULL,
  `rue` VARCHAR(200) NOT NULL,
  `codepostal` INT NOT NULL,
  PRIMARY KEY (`idadresse`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`client` (
  `idclient` INT NOT NULL,
  `nom` VARCHAR(45) NOT NULL,
  `adresse` VARCHAR(45) NOT NULL,
  `type` VARCHAR(45) NOT NULL,
  `telephone` INT NOT NULL,
  `adresse_idadresse` INT NOT NULL,
  PRIMARY KEY (`idclient`),
  INDEX `fk_client_adresse_idx` (`adresse_idadresse` ASC),
  CONSTRAINT `fk_client_adresse`
    FOREIGN KEY (`adresse_idadresse`)
    REFERENCES `mydb`.`adresse` (`idadresse`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fichelocation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fichelocation` (
  `idfichelocation` INT NOT NULL,
  `date` DATE NOT NULL,
  `materiel` VARCHAR(45) NOT NULL,
  `dureJours` INT NOT NULL,
  `materiel_idmateriel` INT NOT NULL,
  PRIMARY KEY (`idfichelocation`, `materiel_idmateriel`),
  INDEX `fk_fichelocation_materiel1_idx` (`materiel_idmateriel` ASC),
  CONSTRAINT `fk_fichelocation_materiel1`
    FOREIGN KEY (`materiel_idmateriel`)
    REFERENCES `mydb`.`materiel` (`idmateriel`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`fichelocation_has_client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`fichelocation_has_client` (
  `fichelocation_idfichelocation` INT NOT NULL,
  `client_idclient` INT NOT NULL,
  PRIMARY KEY (`fichelocation_idfichelocation`, `client_idclient`),
  INDEX `fk_fichelocation_has_client_client1_idx` (`client_idclient` ASC),
  INDEX `fk_fichelocation_has_client_fichelocation1_idx` (`fichelocation_idfichelocation` ASC),
  CONSTRAINT `fk_fichelocation_has_client_fichelocation1`
    FOREIGN KEY (`fichelocation_idfichelocation`)
    REFERENCES `mydb`.`fichelocation` (`idfichelocation`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_fichelocation_has_client_client1`
    FOREIGN KEY (`client_idclient`)
    REFERENCES `mydb`.`client` (`idclient`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
