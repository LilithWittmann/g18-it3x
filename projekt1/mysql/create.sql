SET FOREIGN_KEY_CHECKS = 0;

CREATE TABLE `attribute_to_component` (
  `attribute_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  KEY `fk_component_attributes_has_components_components1` (`component_id`),
  KEY `fk_component_attributes_has_components_component_attributes1` (`attribute_id`),
  CONSTRAINT `fk_component_attributes_has_components_component_attributes1` FOREIGN KEY (`attribute_id`) REFERENCES `component_attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_components_components1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  PRIMARY KEY(attribute_id, component_id, value)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `attribute_to_type` (
  `attribute_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  KEY `fk_component_attributes_has_component_types_component_types1` (`component_id`),
  KEY `fk_component_attributes_has_component_types_component_attribu1` (`attribute_id`),
  CONSTRAINT `fk_component_attributes_has_component_types_component_attribu1` FOREIGN KEY (`attribute_id`) REFERENCES `component_attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_component_types_component_types1` FOREIGN KEY (`component_id`) REFERENCES `component_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  PRIMARY KEY (attribute_id, component_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `component_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `component_ergonomics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `component_seals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `component_to_ergonomics` (
  `component_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  KEY `fk_components_has_component_ergonomics_component_ergonomics1` (`attribute_id`),
  KEY `fk_components_has_component_ergonomics_components1` (`component_id`),
  CONSTRAINT `fk_components_has_component_ergonomics_components1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_ergonomics_component_ergonomics1` FOREIGN KEY (`attribute_id`) REFERENCES `component_ergonomics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  PRIMARY KEY (component_id, attribute_id, value)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `component_to_seals` (
  `component_id` int(11) NOT NULL,
  `seal_id` int(11) NOT NULL,
  KEY `fk_components_has_component_seals_component_seals1` (`seal_id`),
  KEY `fk_components_has_component_seals_components` (`component_id`),
  CONSTRAINT `fk_components_has_component_seals_components` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_seals_component_seals1` FOREIGN KEY (`seal_id`) REFERENCES `component_seals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `component_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

CREATE TABLE `components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_components_component_types1` (`type_id`),
  CONSTRAINT `fk_components_component_types1` FOREIGN KEY (`type_id`) REFERENCES `component_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
CREATE TABLE `type_to_attribute` (
  `type_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  KEY `fk_component_types_has_component_attributes_component_attribu1` (`attribute_id`),
  KEY `fk_component_types_has_component_attributes_component_types1` (`type_id`),
  CONSTRAINT `fk_component_types_has_component_attributes_component_types1` FOREIGN KEY (`type_id`) REFERENCES `component_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_types_has_component_attributes_component_attribu1` FOREIGN KEY (`attribute_id`) REFERENCES `component_attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  PRIMARY KEY(type_id, attribute_id)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;


SET FOREIGN_KEY_CHECKS = 1;
