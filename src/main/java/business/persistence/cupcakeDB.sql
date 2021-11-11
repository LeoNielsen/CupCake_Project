-- MySQL Workbench Synchronization
-- Generated: 2021-11-10 12:05
-- Model: New Model
-- Version: 1.0
-- Project: Name of the project
-- Author: leoni

SET @OLD_UNIQUE_CHECKS = @@UNIQUE_CHECKS, UNIQUE_CHECKS = 0;
SET @OLD_FOREIGN_KEY_CHECKS = @@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS = 0;
SET @OLD_SQL_MODE = @@SQL_MODE, SQL_MODE =
        'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8;

ALTER TABLE `cupcake`.`users`
    ADD INDEX `fk_users_zipcode1_idx` (`user_zipcode` ASC) VISIBLE,
    DROP INDEX `fk_users_zipcode1_idx`;
;

ALTER TABLE `cupcake`.`cupcake`
    DROP COLUMN `topping_name`,
    DROP COLUMN `base_name`,
    ADD COLUMN `base_name`    VARCHAR(45) NOT NULL AFTER `id_order`,
    ADD COLUMN `topping_name` VARCHAR(45) NOT NULL AFTER `base_name`,
    ADD INDEX `fk_cupcake_topping1_idx` (`topping_name` ASC) VISIBLE,
    ADD INDEX `fk_cupcake_base1_idx` (`base_name` ASC) VISIBLE,
    DROP INDEX `fk_cupcake_base1_idx`,
    DROP INDEX `fk_cupcake_topping1_idx`;
;

ALTER TABLE `cupcake`.`users`
    ADD CONSTRAINT `fk_users_zipcode1`
        FOREIGN KEY (`user_zipcode`)
            REFERENCES `cupcake`.`zipcode` (`id_zipcode`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;

ALTER TABLE `cupcake`.`order`
    ADD CONSTRAINT `fk_order_users1`
        FOREIGN KEY (`id_user`)
            REFERENCES `cupcake`.`users` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;

ALTER TABLE `cupcake`.`cupcake`
    ADD CONSTRAINT `fk_cupcake_order1`
        FOREIGN KEY (`id_order`)
            REFERENCES `cupcake`.`order` (`id`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_cupcake_topping1`
        FOREIGN KEY (`topping_name`)
            REFERENCES `cupcake`.`topping` (`name`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION,
    ADD CONSTRAINT `fk_cupcake_base1`
        FOREIGN KEY (`base_name`)
            REFERENCES `cupcake`.`base` (`name`)
            ON DELETE NO ACTION
            ON UPDATE NO ACTION;


SET SQL_MODE = @OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS = @OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS = @OLD_UNIQUE_CHECKS;

LOCK TABLES `topping` WRITE;
INSERT INTO `topping`VALUES
('chocolate', 5),
('blueberry', 5),
('raspberry', 5),
('crispy', 5),
('strawberry', 5),
('rum', 5),
('orange', 5),
('lemon', 5),
('bluecheese', 5);
UNLOCK TABLES;

LOCK TABLES `base` WRITE;
INSERT INTO `base`VALUES
('chocolate', 5),
('vanilla', 5),
('nutmeg', 5),
('pistacio', 5),
('almond', 5);
UNLOCK TABLES;
