SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`component_types`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`component_types` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`components`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`components` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `type_id` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  `price` DECIMAL(10,2) NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_components_component_types1` (`type_id` ASC) ,
  CONSTRAINT `fk_components_component_types1`
    FOREIGN KEY (`type_id` )
    REFERENCES `mydb`.`component_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`component_ergonomics`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`component_ergonomics` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`component_seals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`component_seals` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  `description` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`component_to_seals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`component_to_seals` (
  `component_id` INT NOT NULL ,
  `seal_id` INT NOT NULL ,
  INDEX `fk_components_has_component_seals_component_seals1` (`seal_id` ASC) ,
  INDEX `fk_components_has_component_seals_components` (`component_id` ASC) ,
  CONSTRAINT `fk_components_has_component_seals_components`
    FOREIGN KEY (`component_id` )
    REFERENCES `mydb`.`components` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_seals_component_seals1`
    FOREIGN KEY (`seal_id` )
    REFERENCES `mydb`.`component_seals` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`component_to_ergonomics`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`component_to_ergonomics` (
  `component_id` INT NOT NULL ,
  `attribute_id` INT NOT NULL ,
  `value` VARCHAR(255) NOT NULL ,
  INDEX `fk_components_has_component_ergonomics_component_ergonomics1` (`attribute_id` ASC) ,
  INDEX `fk_components_has_component_ergonomics_components1` (`component_id` ASC) ,
  CONSTRAINT `fk_components_has_component_ergonomics_components1`
    FOREIGN KEY (`component_id` )
    REFERENCES `mydb`.`components` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_ergonomics_component_ergonomics1`
    FOREIGN KEY (`attribute_id` )
    REFERENCES `mydb`.`component_ergonomics` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`component_attributes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`component_attributes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  `abbreviation` VARCHAR(20) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`attribute_to_component`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`attribute_to_component` (
  `attribute_id` INT NOT NULL ,
  `component_id` INT NOT NULL ,
  `value` VARCHAR(255) NOT NULL ,
  INDEX `fk_component_attributes_has_components_components1` (`component_id` ASC) ,
  INDEX `fk_component_attributes_has_components_component_attributes1` (`attribute_id` ASC) ,
  CONSTRAINT `fk_component_attributes_has_components_component_attributes1`
    FOREIGN KEY (`attribute_id` )
    REFERENCES `mydb`.`component_attributes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_components_components1`
    FOREIGN KEY (`component_id` )
    REFERENCES `mydb`.`components` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`type_to_attribute`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`type_to_attribute` (
  `type_id` INT NOT NULL ,
  `attribute_id` INT NOT NULL ,
  INDEX `fk_component_types_has_component_attributes_component_attribu1` (`attribute_id` ASC) ,
  INDEX `fk_component_types_has_component_attributes_component_types1` (`type_id` ASC) ,
  CONSTRAINT `fk_component_types_has_component_attributes_component_types1`
    FOREIGN KEY (`type_id` )
    REFERENCES `mydb`.`component_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_types_has_component_attributes_component_attribu1`
    FOREIGN KEY (`attribute_id` )
    REFERENCES `mydb`.`component_attributes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`attribute_to_type`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `mydb`.`attribute_to_type` (
  `attribute_id` INT NOT NULL ,
  `component_id` INT NOT NULL ,
  INDEX `fk_component_attributes_has_component_types_component_types1` (`component_id` ASC) ,
  INDEX `fk_component_attributes_has_component_types_component_attribu1` (`attribute_id` ASC) ,
  CONSTRAINT `fk_component_attributes_has_component_types_component_attribu1`
    FOREIGN KEY (`attribute_id` )
    REFERENCES `mydb`.`component_attributes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_component_types_component_types1`
    FOREIGN KEY (`component_id` )
    REFERENCES `mydb`.`component_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
