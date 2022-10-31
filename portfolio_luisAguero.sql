-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`portfolio`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`portfolio` (
  `idportfolio` INT NOT NULL,
  `usuario` VARCHAR(60) NOT NULL,
  `contrsenia` VARCHAR(60) NOT NULL,
  PRIMARY KEY (`idportfolio`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`datosPersonales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`datosPersonales` (
  `iddatosPersonales` INT NOT NULL AUTO_INCREMENT,
  `nombre` VARCHAR(65) NOT NULL,
  `apellido` VARCHAR(45) NULL,
  `dni` INT NULL,
  `nacionalidad` VARCHAR(60) NULL,
  `provincia` VARCHAR(60) NOT NULL,
  `localidad` VARCHAR(45) NOT NULL,
  `direccion` VARCHAR(80) NOT NULL,
  `portfolio_idportfolio` INT NOT NULL,
  PRIMARY KEY (`iddatosPersonales`),
  INDEX `fk_datosPersonales_portfolio_idx` (`portfolio_idportfolio` ASC) VISIBLE,
  CONSTRAINT `fk_datosPersonales_portfolio`
    FOREIGN KEY (`portfolio_idportfolio`)
    REFERENCES `mydb`.`portfolio` (`idportfolio`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`antecedentesLaborales`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`antecedentesLaborales` (
  `idantecedentesLaborales` INT NOT NULL,
  `antecedentesLaboralescol` VARCHAR(300) NOT NULL,
  `datosPersonales_iddatosPersonales` INT NOT NULL,
  PRIMARY KEY (`idantecedentesLaborales`),
  INDEX `fk_antecedentesLaborales_datosPersonales1_idx` (`datosPersonales_iddatosPersonales` ASC) VISIBLE,
  CONSTRAINT `fk_antecedentesLaborales_datosPersonales1`
    FOREIGN KEY (`datosPersonales_iddatosPersonales`)
    REFERENCES `mydb`.`datosPersonales` (`iddatosPersonales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`educacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`educacion` (
  `ideducacion` INT NOT NULL,
  `NivelEducativo` VARCHAR(100) NULL,
  `datosPersonales_iddatosPersonales` INT NOT NULL,
  PRIMARY KEY (`ideducacion`),
  INDEX `fk_educacion_datosPersonales1_idx` (`datosPersonales_iddatosPersonales` ASC) VISIBLE,
  CONSTRAINT `fk_educacion_datosPersonales1`
    FOREIGN KEY (`datosPersonales_iddatosPersonales`)
    REFERENCES `mydb`.`datosPersonales` (`iddatosPersonales`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

USE `mydb` ;

-- -----------------------------------------------------
-- Placeholder table for view `mydb`.`view1`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`view1` (`id` INT);

-- -----------------------------------------------------
-- View `mydb`.`view1`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`view1`;
USE `mydb`;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
