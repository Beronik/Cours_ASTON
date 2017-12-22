-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL,ALLOW_INVALID_DATES';

-- -----------------------------------------------------
-- Schema revue
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema revue
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `revue` DEFAULT CHARACTER SET utf8 ;
USE `revue` ;

-- -----------------------------------------------------
-- Table `revue`.`REVUE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revue`.`REVUE` (
  `idRevue` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL,
  `periodicite` TINYINT(1) NULL,
  PRIMARY KEY (`idRevue`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `revue`.`AUTEUR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revue`.`AUTEUR` (
  `idAuteur` INT NOT NULL AUTO_INCREMENT,
  `nom` VARCHAR(255) NULL,
  `prenom` VARCHAR(255) NULL,
  `email` VARCHAR(255) NULL,
  PRIMARY KEY (`idAuteur`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `revue`.`ARTICLE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revue`.`ARTICLE` (
  `idArticle` INT NOT NULL AUTO_INCREMENT,
  `titre` VARCHAR(255) NULL,
  `contenu` LONGTEXT NULL,
  PRIMARY KEY (`idArticle`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `revue`.`ARTICLE_FAIT_REFERENCE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revue`.`ARTICLE_FAIT_REFERENCE` (
  `ArticleId_Src` INT NOT NULL,
  `ArticleId_Ref` INT NOT NULL,
  PRIMARY KEY (`ArticleId_Src`, `ArticleId_Ref`),
  INDEX `fk_ARTICLE_has_ARTICLE_ARTICLE1_idx` (`ArticleId_Ref` ASC),
  INDEX `fk_ARTICLE_has_ARTICLE_ARTICLE_idx` (`ArticleId_Src` ASC),
  CONSTRAINT `fk_ARTICLE_has_ARTICLE_ARTICLE`
    FOREIGN KEY (`ArticleId_Src`)
    REFERENCES `revue`.`ARTICLE` (`idArticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ARTICLE_has_ARTICLE_ARTICLE1`
    FOREIGN KEY (`ArticleId_Ref`)
    REFERENCES `revue`.`ARTICLE` (`idArticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `revue`.`AUTEUR_ECRIT`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revue`.`AUTEUR_ECRIT` (
  `AUTEUR_id` INT NOT NULL,
  `ARTICLE_id` INT NOT NULL,
  PRIMARY KEY (`AUTEUR_id`, `ARTICLE_id`),
  INDEX `fk_AUTEUR_has_ARTICLE_ARTICLE1_idx` (`ARTICLE_id` ASC),
  INDEX `fk_AUTEUR_has_ARTICLE_AUTEUR1_idx` (`AUTEUR_id` ASC),
  CONSTRAINT `fk_AUTEUR_has_ARTICLE_AUTEUR1`
    FOREIGN KEY (`AUTEUR_id`)
    REFERENCES `revue`.`AUTEUR` (`idAuteur`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_AUTEUR_has_ARTICLE_ARTICLE1`
    FOREIGN KEY (`ARTICLE_id`)
    REFERENCES `revue`.`ARTICLE` (`idArticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `revue`.`PUBLICATION`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revue`.`PUBLICATION` (
  `idNumero` INT NOT NULL AUTO_INCREMENT,
  `annee` VARCHAR(4) NULL,
  `nbPages` INT NULL,
  `REVUE_id` INT NOT NULL,
  PRIMARY KEY (`idNumero`),
  INDEX `fk_PUBLICATION_REVUE1_idx` (`REVUE_id` ASC),
  CONSTRAINT `fk_PUBLICATION_REVUE1`
    FOREIGN KEY (`REVUE_id`)
    REFERENCES `revue`.`REVUE` (`idRevue`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `revue`.`ARTICLE_EST_PUBLIE`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `revue`.`ARTICLE_EST_PUBLIE` (
  `ARTICLE_id` INT NOT NULL,
  `NUMERO_id` INT NOT NULL,
  `pageDebut` INT NULL,
  `pageFin` INT NULL,
  PRIMARY KEY (`ARTICLE_id`, `NUMERO_id`),
  INDEX `fk_ARTICLE_has_NUMERO_NUMERO1_idx` (`NUMERO_id` ASC),
  INDEX `fk_ARTICLE_has_NUMERO_ARTICLE1_idx` (`ARTICLE_id` ASC),
  CONSTRAINT `fk_ARTICLE_has_NUMERO_ARTICLE1`
    FOREIGN KEY (`ARTICLE_id`)
    REFERENCES `revue`.`ARTICLE` (`idArticle`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ARTICLE_has_NUMERO_NUMERO1`
    FOREIGN KEY (`NUMERO_id`)
    REFERENCES `revue`.`PUBLICATION` (`idNumero`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
