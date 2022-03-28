-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema locadora
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema locadora
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `locadora` ;
USE `locadora` ;

-- -----------------------------------------------------
-- Table `locadora`.`atores`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`atores` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`generos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`generos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `genero` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `sobrenome` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `endereco` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`filmes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`filmes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_genero` INT NOT NULL,
  `titulo` VARCHAR(100) NOT NULL,
  `valor` DECIMAL(8,2) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_filmes_1_idx` (`id_genero` ASC) VISIBLE,
  CONSTRAINT `fk_filmes_1`
    FOREIGN KEY (`id_genero`)
    REFERENCES `locadora`.`generos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`atores_filme`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`atores_filme` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_filme` INT NOT NULL,
  `id_ator` INT NOT NULL,
  `personagem` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_atores_filme_1_idx` (`id_filme` ASC) VISIBLE,
  INDEX `fk_atores_filme_2_idx` (`id_ator` ASC) VISIBLE,
  CONSTRAINT `fk_atores_filme_1`
    FOREIGN KEY (`id_filme`)
    REFERENCES `locadora`.`filmes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_atores_filme_2`
    FOREIGN KEY (`id_ator`)
    REFERENCES `locadora`.`atores` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`dvds`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`dvds` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_filme` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_dvds_1_idx` (`id_filme` ASC) VISIBLE,
  CONSTRAINT `fk_dvds_1`
    FOREIGN KEY (`id_filme`)
    REFERENCES `locadora`.`filmes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`emprestimos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`emprestimos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATETIME NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_emprestimos_1_idx` (`id_cliente` ASC) VISIBLE,
  CONSTRAINT `fk_emprestimos_1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `locadora`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`filmes_emprestimo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`filmes_emprestimo` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_dvd` INT NOT NULL,
  `id_emprestimo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_filmes_emprestimo_1_idx` (`id_dvd` ASC) VISIBLE,
  INDEX `fk_filmes_emprestimo_2_idx` (`id_emprestimo` ASC) VISIBLE,
  CONSTRAINT `fk_filmes_emprestimo_1`
    FOREIGN KEY (`id_dvd`)
    REFERENCES `locadora`.`dvds` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filmes_emprestimo_2`
    FOREIGN KEY (`id_emprestimo`)
    REFERENCES `locadora`.`emprestimos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`devolucoes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`devolucoes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_emprestimo` INT NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_devolucoes_1_idx` (`id_emprestimo` ASC) VISIBLE,
  CONSTRAINT `fk_devolucoes_1`
    FOREIGN KEY (`id_emprestimo`)
    REFERENCES `locadora`.`emprestimos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `locadora`.`filmes_devolucao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `locadora`.`filmes_devolucao` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_devolucao` INT NOT NULL,
  `id_filme_emprestimo` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_filmes_devolucao_1_idx` (`id_devolucao` ASC) VISIBLE,
  INDEX `fk_filmes_devolucao_2_idx` (`id_filme_emprestimo` ASC) VISIBLE,
  CONSTRAINT `fk_filmes_devolucao_1`
    FOREIGN KEY (`id_devolucao`)
    REFERENCES `locadora`.`devolucoes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_filmes_devolucao_2`
    FOREIGN KEY (`id_filme_emprestimo`)
    REFERENCES `locadora`.`filmes_emprestimo` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
