-- -----------------------------------------------------
-- Table `Zona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Zona` (
  `idZona` INT NOT NULL AUTO_INCREMENT,
  `nomeZona` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`idZona`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Bairro` (
  `idBairro` INT NOT NULL AUTO_INCREMENT,
  `nomeBairro` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idBairro`))
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Logradouro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Logradouro` (
  `CEP` INT NOT NULL,
  `nomeLogradouro` VARCHAR(150) NOT NULL,
  `tipoLogradouro` VARCHAR(45) NOT NULL,
  `Bairro_idBairro` INT NOT NULL,
  PRIMARY KEY (`CEP`, `Bairro_idBairro`),
  INDEX `fk_Logradouro_Bairro1_idx` (`Bairro_idBairro` ASC) VISIBLE,
  CONSTRAINT `fk_Logradouro_Bairro1`
    FOREIGN KEY (`Bairro_idBairro`)
    REFERENCES `mydb`.`Bairro` (`idBairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Zona_has_Bairro`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Zona_has_Bairro` (
  `Zona_idZona` INT NOT NULL,
  `Bairro_idBairro` INT NOT NULL,
  PRIMARY KEY (`Zona_idZona`, `Bairro_idBairro`),
  INDEX `fk_Zona_has_Bairro_Bairro1_idx` (`Bairro_idBairro` ASC) VISIBLE,
  INDEX `fk_Zona_has_Bairro_Zona_idx` (`Zona_idZona` ASC) VISIBLE,
  CONSTRAINT `fk_Zona_has_Bairro_Zona`
    FOREIGN KEY (`Zona_idZona`)
    REFERENCES `mydb`.`Zona` (`idZona`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Zona_has_Bairro_Bairro1`
    FOREIGN KEY (`Bairro_idBairro`)
    REFERENCES `mydb`.`Bairro` (`idBairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

-- -----------------------------------------------------
-- Table `Lote`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Lote` (
  `idLote` INT NOT NULL,
  `tipoLote` VARCHAR(45) NOT NULL,
  `areaMínimaLote` DOUBLE NOT NULL,
  `testadaMínima` DOUBLE NOT NULL,
  `taxaDePermeabilizacao` DOUBLE NOT NULL,
  `taxaDeOcupacaoMax` DOUBLE NOT NULL,
  `numPavimentos` INT NOT NULL,
  `larguraCalcadaMin` DOUBLE NOT NULL,
  `afastFrontalMin` DOUBLE NOT NULL,
  `coefAproveitamento` DOUBLE NOT NULL,
  `Logradouro_CEP` INT NOT NULL,
  `Logradouro_Bairro_idBairro` INT NOT NULL,
  PRIMARY KEY (`idLote`),
  INDEX `fk_Lote_Logradouro1_idx` (`Logradouro_CEP` ASC, `Logradouro_Bairro_idBairro` ASC) VISIBLE,
  CONSTRAINT `fk_Lote_Logradouro1`
    FOREIGN KEY (`Logradouro_CEP` , `Logradouro_Bairro_idBairro`)
    REFERENCES `mydb`.`Logradouro` (`CEP` , `Bairro_idBairro`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
