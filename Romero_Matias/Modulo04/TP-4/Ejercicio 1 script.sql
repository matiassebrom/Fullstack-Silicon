-- MySQL Script generated by MySQL Workbench
-- Tue Oct 18 07:42:52 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Modulo4_Ejercicio1
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Modulo4_Ejercicio1
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Modulo4_Ejercicio1` DEFAULT CHARACTER SET utf8 ;
USE `Modulo4_Ejercicio1` ;

-- -----------------------------------------------------
-- Table `Modulo4_Ejercicio1`.`ALUMNO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modulo4_Ejercicio1`.`ALUMNO` (
  `Cod_Matrícula` INT NOT NULL,
  `Nombre` VARCHAR(45) NOT NULL,
  `DNI` VARCHAR(45) NULL,
  `FechaNacimiento` DATE NULL,
  `ALUMNOcol` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Matrícula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modulo4_Ejercicio1`.`CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modulo4_Ejercicio1`.`CURSO` (
  `Cod_Curso` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  PRIMARY KEY (`Cod_Curso`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modulo4_Ejercicio1`.`PROFESOR`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modulo4_Ejercicio1`.`PROFESOR` (
  `Id_Profesor` INT NOT NULL,
  `Nombre` VARCHAR(45) NULL,
  `Especialidad` VARCHAR(45) NULL,
  `email` VARCHAR(45) NULL,
  PRIMARY KEY (`Id_Profesor`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modulo4_Ejercicio1`.`ALUMNO_has_CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modulo4_Ejercicio1`.`ALUMNO_has_CURSO` (
  `ALUMNO_Cod_Matrícula` INT NOT NULL,
  `CURSO_Cod_Curso` INT NOT NULL,
  PRIMARY KEY (`ALUMNO_Cod_Matrícula`, `CURSO_Cod_Curso`),
  INDEX `fk_ALUMNO_has_CURSO_CURSO1_idx` (`CURSO_Cod_Curso` ASC) VISIBLE,
  INDEX `fk_ALUMNO_has_CURSO_ALUMNO_idx` (`ALUMNO_Cod_Matrícula` ASC) VISIBLE,
  CONSTRAINT `fk_ALUMNO_has_CURSO_ALUMNO`
    FOREIGN KEY (`ALUMNO_Cod_Matrícula`)
    REFERENCES `Modulo4_Ejercicio1`.`ALUMNO` (`Cod_Matrícula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_ALUMNO_has_CURSO_CURSO1`
    FOREIGN KEY (`CURSO_Cod_Curso`)
    REFERENCES `Modulo4_Ejercicio1`.`CURSO` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Modulo4_Ejercicio1`.`PROFESOR_has_CURSO`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Modulo4_Ejercicio1`.`PROFESOR_has_CURSO` (
  `PROFESOR_Id_Profesor` INT NOT NULL,
  `CURSO_Cod_Curso` INT NOT NULL,
  PRIMARY KEY (`PROFESOR_Id_Profesor`, `CURSO_Cod_Curso`),
  INDEX `fk_PROFESOR_has_CURSO_CURSO1_idx` (`CURSO_Cod_Curso` ASC) VISIBLE,
  INDEX `fk_PROFESOR_has_CURSO_PROFESOR1_idx` (`PROFESOR_Id_Profesor` ASC) VISIBLE,
  CONSTRAINT `fk_PROFESOR_has_CURSO_PROFESOR1`
    FOREIGN KEY (`PROFESOR_Id_Profesor`)
    REFERENCES `Modulo4_Ejercicio1`.`PROFESOR` (`Id_Profesor`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_PROFESOR_has_CURSO_CURSO1`
    FOREIGN KEY (`CURSO_Cod_Curso`)
    REFERENCES `Modulo4_Ejercicio1`.`CURSO` (`Cod_Curso`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
