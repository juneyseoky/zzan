SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema zzan
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema zzan
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `zzan` DEFAULT CHARACTER SET utf8 ;
USE `zzan` ;

-- -----------------------------------------------------
-- Table `zzan`.`Member`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`Member` (
  `mNum` INT NOT NULL AUTO_INCREMENT,
  `mId` CHAR(20) NOT NULL,
  `mPw` CHAR(20) NOT NULL,
  `mName` CHAR(15) NOT NULL,
  `mBirthday` CHAR(10) NOT NULL,
  `mAddr` CHAR(100) NULL,
  `mEmail` CHAR(50) NOT NULL,
  `mPhone` CHAR(20) NOT NULL,
  `regTM` TIMESTAMP NULL DEFAULT now(),
  UNIQUE INDEX `mNum_UNIQUE` (`mNum` ASC) VISIBLE,
  PRIMARY KEY (`mId`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zzan`.`Admin`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`Admin` (
  `num` INT NOT NULL AUTO_INCREMENT,
  `id` CHAR(20) NOT NULL,
  `pw` CHAR(20) NOT NULL,
  `name` CHAR(15) NOT NULL,
  `phone` CHAR(20) NOT NULL,
  `regTM` TIMESTAMP NOT NULL DEFAULT now(),
  UNIQUE INDEX `num_UNIQUE` (`num` ASC) VISIBLE,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zzan`.`Product`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`Product` (
  `pCode` CHAR(10) NOT NULL,
  `pName` CHAR(50) NOT NULL,
  `pContent` TEXT NOT NULL,
  `price` INT NOT NULL,
  `pCnt` INT NULL DEFAULT 0,
  `pType` CHAR(10) NULL,
  `pImage01` CHAR(255) NULL,
  `pImage02` CHAR(255) NULL,
  PRIMARY KEY (`pCode`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zzan`.`BBS`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`BBS` (
  `bNum` INT NOT NULL AUTO_INCREMENT,
  `bTitle` CHAR(50) NOT NULL,
  `bContent` TEXT NOT NULL,
  `bMemId` CHAR(20) NOT NULL,
  `bRegTM` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`bNum`),
  INDEX `MemId_idx` (`bMemId` ASC) VISIBLE,
  CONSTRAINT `MemId`
    FOREIGN KEY (`bMemId`)
    REFERENCES `zzan`.`Member` (`mId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zzan`.`Notice`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`Notice` (
  `nNum` INT NOT NULL AUTO_INCREMENT,
  `nTitle` CHAR(50) NOT NULL,
  `nContent` TEXT NOT NULL,
  `admin` CHAR(20) NOT NULL,
  `nRegTM` TIMESTAMP NOT NULL,
  PRIMARY KEY (`nNum`),
  INDEX `adminId_idx` (`admin` ASC) VISIBLE,
  CONSTRAINT `adminId`
    FOREIGN KEY (`admin`)
    REFERENCES `zzan`.`Admin` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = '        ';


-- -----------------------------------------------------
-- Table `zzan`.`Cart`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`Cart` (
  `cartCode` INT NOT NULL AUTO_INCREMENT,
  `cMemid` CHAR(20) NOT NULL,
  `createTM` TIMESTAMP NOT NULL,
  PRIMARY KEY (`cartCode`),
  INDEX `cartMemId_idx` (`cMemid` ASC) VISIBLE,
  CONSTRAINT `cartMemId`
    FOREIGN KEY (`cMemid`)
    REFERENCES `zzan`.`Member` (`mId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zzan`.`CartProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`CartProduct` (
  `cpCode` INT NOT NULL AUTO_INCREMENT,
  `cartCode` INT NOT NULL,
  `cpPrCode` CHAR(20) NOT NULL,
  `cpQuantity` INT NOT NULL,
  `cpRegTM` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`cpCode`),
  INDEX `cartCode_idx` (`cartCode` ASC) VISIBLE,
  INDEX `cartprCode_idx` (`cpPrCode` ASC) VISIBLE,
  CONSTRAINT `cartCode`
    FOREIGN KEY (`cartCode`)
    REFERENCES `zzan`.`Cart` (`cartCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `cartprCode`
    FOREIGN KEY (`cpPrCode`)
    REFERENCES `zzan`.`Product` (`pCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zzan`.`Order`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`Order` (
  `oNum` INT NOT NULL AUTO_INCREMENT,
  `totalPrice` INT NOT NULL,
  `status` INT NOT NULL DEFAULT 0,
  `userPhone` CHAR(20) NOT NULL,
  `userAddr` CHAR(100) NOT NULL,
  `userId` CHAR(20) NOT NULL,
  `orderTM` TIMESTAMP NOT NULL DEFAULT now(),
  PRIMARY KEY (`oNum`),
  INDEX `orderMemId_idx` (`userId` ASC) VISIBLE,
  CONSTRAINT `orderMemId`
    FOREIGN KEY (`userId`)
    REFERENCES `zzan`.`Member` (`mId`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `zzan`.`OrderProduct`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `zzan`.`OrderProduct` (
  `opNum` INT NOT NULL AUTO_INCREMENT,
  `productCode` CHAR(20) NOT NULL,
  `orderNum` INT NOT NULL,
  `price` INT NOT NULL,
  `opQuantity` INT NOT NULL,
  PRIMARY KEY (`opNum`),
  INDEX `productCode_idx` (`productCode` ASC) VISIBLE,
  INDEX `orderNum_idx` (`orderNum` ASC) VISIBLE,
  CONSTRAINT `productCode`
    FOREIGN KEY (`productCode`)
    REFERENCES `zzan`.`Product` (`pCode`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `orderNum`
    FOREIGN KEY (`orderNum`)
    REFERENCES `zzan`.`Order` (`oNum`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;