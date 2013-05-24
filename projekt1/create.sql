# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.5.29-MariaDB-log)
# Database: projekt-1
# Generation Time: 2013-05-23 08:13:13 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table attribute_to_component
# ------------------------------------------------------------

CREATE TABLE `attribute_to_component` (
  `attribute_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  KEY `fk_component_attributes_has_components_components1` (`component_id`),
  KEY `fk_component_attributes_has_components_component_attributes1` (`attribute_id`),
  CONSTRAINT `fk_component_attributes_has_components_component_attributes1` FOREIGN KEY (`attribute_id`) REFERENCES `component_attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_components_components1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table attribute_to_type
# ------------------------------------------------------------

CREATE TABLE `attribute_to_type` (
  `attribute_id` int(11) NOT NULL,
  `component_id` int(11) NOT NULL,
  KEY `fk_component_attributes_has_component_types_component_types1` (`component_id`),
  KEY `fk_component_attributes_has_component_types_component_attribu1` (`attribute_id`),
  CONSTRAINT `fk_component_attributes_has_component_types_component_attribu1` FOREIGN KEY (`attribute_id`) REFERENCES `component_attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_attributes_has_component_types_component_types1` FOREIGN KEY (`component_id`) REFERENCES `component_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table component_attributes
# ------------------------------------------------------------

CREATE TABLE `component_attributes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `abbreviation` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table component_ergonomics
# ------------------------------------------------------------

CREATE TABLE `component_ergonomics` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table component_seals
# ------------------------------------------------------------

CREATE TABLE `component_seals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table component_to_ergonomics
# ------------------------------------------------------------

CREATE TABLE `component_to_ergonomics` (
  `component_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  `value` varchar(255) NOT NULL,
  KEY `fk_components_has_component_ergonomics_component_ergonomics1` (`attribute_id`),
  KEY `fk_components_has_component_ergonomics_components1` (`component_id`),
  CONSTRAINT `fk_components_has_component_ergonomics_components1` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_ergonomics_component_ergonomics1` FOREIGN KEY (`attribute_id`) REFERENCES `component_ergonomics` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table component_to_seals
# ------------------------------------------------------------

CREATE TABLE `component_to_seals` (
  `component_id` int(11) NOT NULL,
  `seal_id` int(11) NOT NULL,
  KEY `fk_components_has_component_seals_component_seals1` (`seal_id`),
  KEY `fk_components_has_component_seals_components` (`component_id`),
  CONSTRAINT `fk_components_has_component_seals_components` FOREIGN KEY (`component_id`) REFERENCES `components` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_components_has_component_seals_component_seals1` FOREIGN KEY (`seal_id`) REFERENCES `component_seals` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table component_types
# ------------------------------------------------------------

CREATE TABLE `component_types` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table components
# ------------------------------------------------------------

CREATE TABLE `components` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type_id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_components_component_types1` (`type_id`),
  CONSTRAINT `fk_components_component_types1` FOREIGN KEY (`type_id`) REFERENCES `component_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;



# Dump of table type_to_attribute
# ------------------------------------------------------------

CREATE TABLE `type_to_attribute` (
  `type_id` int(11) NOT NULL,
  `attribute_id` int(11) NOT NULL,
  KEY `fk_component_types_has_component_attributes_component_attribu1` (`attribute_id`),
  KEY `fk_component_types_has_component_attributes_component_types1` (`type_id`),
  CONSTRAINT `fk_component_types_has_component_attributes_component_types1` FOREIGN KEY (`type_id`) REFERENCES `component_types` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_component_types_has_component_attributes_component_attribu1` FOREIGN KEY (`attribute_id`) REFERENCES `component_attributes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;




/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
