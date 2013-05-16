CREATE  TABLE IF NOT EXISTS `component_attribute_values` (
  `idcomponent_attribute_values` INT NOT NULL ,
  `value` VARCHAR(255) NULL ,
  PRIMARY KEY (`idcomponent_attribute_values`) )
ENGINE = InnoDB;


CREATE  TABLE IF NOT EXISTS `component_attributes` (
  `idcomponent_attributes` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  `abbreviation` VARCHAR(20) NULL ,
  PRIMARY KEY (`idcomponent_attributes`) )
ENGINE = InnoDB;


CREATE  TABLE IF NOT EXISTS `component_ergonomic_values` (
  `idcomponent_attribute_values` INT NOT NULL ,
  `value` VARCHAR(255) NULL ,
  PRIMARY KEY (`idcomponent_attribute_values`) )
ENGINE = InnoDB;
 

CREATE  TABLE IF NOT EXISTS `component_seals` (
  `idcomponent_seals` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  `description` TEXT NULL ,
  PRIMARY KEY (`idcomponent_seals`) )
ENGINE = InnoDB;
 
CREATE  TABLE IF NOT EXISTS `component_types` (
  `idcomponent_types` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  PRIMARY KEY (`idcomponent_types`) )
ENGINE = InnoDB;
 


CREATE  TABLE IF NOT EXISTS `components` (
  `idcomponents` INT NOT NULL ,
  `component_types_idcomponent_types` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  `price` DECIMAL NULL ,
  PRIMARY KEY (`idcomponents`) ,
  INDEX `fk_components_component_types1` (`component_types_idcomponent_types` ASC) ,
  CONSTRAINT `fk_components_component_types1`
    FOREIGN KEY (`component_types_idcomponent_types` )
    REFERENCES `component_types` (`idcomponent_types` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;




 
 
CREATE  TABLE IF NOT EXISTS `component_attributes_has_components` (
  `component_attributes_idcomponent_attributes` INT NOT NULL ,
  `components_idcomponents` INT NOT NULL ,
  `component_attribute_values_idcomponent_attribute_values` INT NOT NULL ,
  PRIMARY KEY (`component_attributes_idcomponent_attributes`, `components_idcomponents`, `component_attribute_values_idcomponent_attribute_values`) ,
  INDEX `fk_component_attributes_has_components_components1` (`components_idcomponents` ASC) ,
  INDEX `fk_component_attributes_has_components_component_attributes1` (`component_attributes_idcomponent_attributes` ASC) ,
  INDEX `fk_component_attributes_has_components_component_attribute_va1` (`component_attribute_values_idcomponent_attribute_values` ASC) ,
  CONSTRAINT `fk_component_attributes_has_components_component_attributes1`
    FOREIGN KEY (`component_attributes_idcomponent_attributes` )
    REFERENCES `component_attributes` (`idcomponent_attributes` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_components_components1`
    FOREIGN KEY (`components_idcomponents` )
    REFERENCES `components` (`idcomponents` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_components_component_attribute_va1`
    FOREIGN KEY (`component_attribute_values_idcomponent_attribute_values` )
    REFERENCES `component_attribute_values` (`idcomponent_attribute_values` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
 
CREATE  TABLE IF NOT EXISTS `component_ergonomics` (
  `idcomponent_attributes` INT NOT NULL ,
  `name` VARCHAR(255) NULL ,
  PRIMARY KEY (`idcomponent_attributes`) )
ENGINE = InnoDB;
 

CREATE  TABLE IF NOT EXISTS `component_types_has_component_attributes` (
  `component_types_idcomponent_types` INT NOT NULL ,
  `component_attributes_idcomponent_attributes` INT NOT NULL ,
  PRIMARY KEY (`component_types_idcomponent_types`, `component_attributes_idcomponent_attributes`) ,
  INDEX `fk_component_types_has_component_attributes_component_attribu1` (`component_attributes_idcomponent_attributes` ASC) ,
  INDEX `fk_component_types_has_component_attributes_component_types1` (`component_types_idcomponent_types` ASC) ,
  CONSTRAINT `fk_component_types_has_component_attributes_component_types1`
    FOREIGN KEY (`component_types_idcomponent_types` )
    REFERENCES `component_types` (`idcomponent_types` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_types_has_component_attributes_component_attribu1`
    FOREIGN KEY (`component_attributes_idcomponent_attributes` )
    REFERENCES `component_attributes` (`idcomponent_attributes` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
 

 
CREATE  TABLE IF NOT EXISTS `components_has_component_ergonomics` (
  `components_idcomponents` INT NOT NULL ,
  `component_ergonomics_idcomponent_attributes` INT NOT NULL ,
  `component_ergonomic_values_idcomponent_attribute_values` INT NOT NULL ,
  PRIMARY KEY (`components_idcomponents`, `component_ergonomics_idcomponent_attributes`, `component_ergonomic_values_idcomponent_attribute_values`) ,
  INDEX `fk_components_has_component_ergonomics_component_ergonomics1` (`component_ergonomics_idcomponent_attributes` ASC) ,
  INDEX `fk_components_has_component_ergonomics_components1` (`components_idcomponents` ASC) ,
  INDEX `fk_components_has_component_ergonomics_component_ergonomic_va1` (`component_ergonomic_values_idcomponent_attribute_values` ASC) ,
  CONSTRAINT `fk_components_has_component_ergonomics_components1`
    FOREIGN KEY (`components_idcomponents` )
    REFERENCES `components` (`idcomponents` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_ergonomics_component_ergonomics1`
    FOREIGN KEY (`component_ergonomics_idcomponent_attributes` )
    REFERENCES `component_ergonomics` (`idcomponent_attributes` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_ergonomics_component_ergonomic_va1`
    FOREIGN KEY (`component_ergonomic_values_idcomponent_attribute_values` )
    REFERENCES `component_ergonomic_values` (`idcomponent_attribute_values` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
 
CREATE  TABLE IF NOT EXISTS `components_has_component_seals` (
  `components_idcomponents` INT NOT NULL ,
  `component_seals_idcomponent_seals` INT NOT NULL ,
  PRIMARY KEY (`components_idcomponents`, `component_seals_idcomponent_seals`) ,
  INDEX `fk_components_has_component_seals_component_seals1` (`component_seals_idcomponent_seals` ASC) ,
  INDEX `fk_components_has_component_seals_components` (`components_idcomponents` ASC) ,
  CONSTRAINT `fk_components_has_component_seals_components`
    FOREIGN KEY (`components_idcomponents` )
    REFERENCES `components` (`idcomponents` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_seals_component_seals1`
    FOREIGN KEY (`component_seals_idcomponent_seals` )
    REFERENCES `component_seals` (`idcomponent_seals` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


