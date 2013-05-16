SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

-- -----------------------------------------------------
-- Table `component_types`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `component_types` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `components`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `components` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `type_id` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  `price` DECIMAL NULL ,
  PRIMARY KEY (`id`) ,
  INDEX `fk_components_component_types1` (`type_id` ASC) ,
  CONSTRAINT `fk_components_component_types1`
    FOREIGN KEY (`type_id` )
    REFERENCES `component_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `component_ergonomics`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `component_ergonomics` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `component_ergonomic_values`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `component_ergonomic_values` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `value` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `component_seals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `component_seals` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  `description` TEXT NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `components_has_component_seals`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `components_has_component_seals` (
  `component_id` INT NOT NULL ,
  `seal_id` INT NOT NULL ,
  PRIMARY KEY (`component_id`, `seal_id`) ,
  INDEX `fk_components_has_component_seals_component_seals1` (`seal_id` ASC) ,
  INDEX `fk_components_has_component_seals_components` (`component_id` ASC) ,
  CONSTRAINT `fk_components_has_component_seals_components`
    FOREIGN KEY (`component_id` )
    REFERENCES `components` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_seals_component_seals1`
    FOREIGN KEY (`seal_id` )
    REFERENCES `component_seals` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `component_to_ergonomics`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `component_to_ergonomics` (
  `component_id` INT NOT NULL ,
  `attribute_id` INT NOT NULL ,
  `attribute_value_id` INT NOT NULL ,
  PRIMARY KEY (`component_id`, `attribute_id`, `attribute_value_id`) ,
  INDEX `fk_components_has_component_ergonomics_component_ergonomics1` (`attribute_id` ASC) ,
  INDEX `fk_components_has_component_ergonomics_components1` (`component_id` ASC) ,
  INDEX `fk_components_has_component_ergonomics_component_ergonomic_va1` (`attribute_value_id` ASC) ,
  CONSTRAINT `fk_components_has_component_ergonomics_components1`
    FOREIGN KEY (`component_id` )
    REFERENCES `components` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_ergonomics_component_ergonomics1`
    FOREIGN KEY (`attribute_id` )
    REFERENCES `component_ergonomics` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_ergonomics_component_ergonomic_va1`
    FOREIGN KEY (`attribute_value_id` )
    REFERENCES `component_ergonomic_values` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `component_attributes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `component_attributes` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `name` VARCHAR(255) NULL ,
  `abbreviation` VARCHAR(20) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `component_attribute_values`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `component_attribute_values` (
  `id` INT NOT NULL AUTO_INCREMENT ,
  `value` VARCHAR(255) NULL ,
  PRIMARY KEY (`id`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `attribute_to_component`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `attribute_to_component` (
  `attribute_id` INT NOT NULL ,
  `component_id` INT NOT NULL ,
  `value_id` INT NOT NULL ,
  PRIMARY KEY (`attribute_id`, `component_id`, `value_id`) ,
  INDEX `fk_component_attributes_has_components_components1` (`component_id` ASC) ,
  INDEX `fk_component_attributes_has_components_component_attributes1` (`attribute_id` ASC) ,
  INDEX `fk_attribute_to_component_component_attribute_values1` (`value_id` ASC) ,
  CONSTRAINT `fk_component_attributes_has_components_component_attributes1`
    FOREIGN KEY (`attribute_id` )
    REFERENCES `component_attributes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_components_components1`
    FOREIGN KEY (`component_id` )
    REFERENCES `components` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_attribute_to_component_component_attribute_values1`
    FOREIGN KEY (`value_id` )
    REFERENCES `component_attribute_values` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `type_to_attribute`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `type_to_attribute` (
  `type_id` INT NOT NULL ,
  `attribute_id` INT NOT NULL ,
  PRIMARY KEY (`type_id`, `attribute_id`) ,
  INDEX `fk_component_types_has_component_attributes_component_attribu1` (`attribute_id` ASC) ,
  INDEX `fk_component_types_has_component_attributes_component_types1` (`type_id` ASC) ,
  CONSTRAINT `fk_component_types_has_component_attributes_component_types1`
    FOREIGN KEY (`type_id` )
    REFERENCES `component_types` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_types_has_component_attributes_component_attribu1`
    FOREIGN KEY (`attribute_id` )
    REFERENCES `component_attributes` (`id` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
