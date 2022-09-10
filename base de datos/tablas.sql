
-- -----------------------------------------------------
-- Schema PortableHospital
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `PortableHospital` DEFAULT CHARACTER SET utf8 ;
USE `PortableHospital` ;

-- -----------------------------------------------------
-- Table `PortableHospital`.`Persona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Persona` (
  `cedula` VARCHAR(20) NOT NULL,
  `nombre` VARCHAR(100) NOT NULL,
  `fecha_nacimiento` DATE NOT NULL,
  `direccion` VARCHAR(100) NOT NULL,
  `telefono` VARCHAR(15) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`cedula`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Eps`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Eps` (
  `idEps` VARCHAR(50) NOT NULL,
  `nombre` VARCHAR(100) NULL,
  PRIMARY KEY (`idEps`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Paciente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Paciente` (
  `idPaciente` VARCHAR(30) NOT NULL,
  `fecha_ingreso` VARCHAR(10) NOT NULL,
  `fecha_alta` VARCHAR(10) NULL,
  `Persona_cedula` VARCHAR(20) NOT NULL,
  `Eps_idEps` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idPaciente`),
  INDEX `fk_Paciente_Persona1_idx` (`Persona_cedula` ASC) VISIBLE,
  INDEX `fk_Paciente_Eps1_idx` (`Eps_idEps` ASC) VISIBLE,
  CONSTRAINT `fk_Paciente_Persona1`
    FOREIGN KEY (`Persona_cedula`)
    REFERENCES `PortableHospital`.`Persona` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Paciente_Eps1`
    FOREIGN KEY (`Eps_idEps`)
    REFERENCES `PortableHospital`.`Eps` (`idEps`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`HistoriaClinica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`HistoriaClinica` (
  `idHistoriaClinica` INT NOT NULL AUTO_INCREMENT,
  `Paciente_idPaciente` VARCHAR(30) NOT NULL,
  PRIMARY KEY (`idHistoriaClinica`),
  INDEX `fk_HistoriaClinica_Paciente1_idx` (`Paciente_idPaciente` ASC) VISIBLE,
  CONSTRAINT `fk_HistoriaClinica_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente`)
    REFERENCES `PortableHospital`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Medico`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Medico` (
  `tarjetaProfesional` VARCHAR(50) NOT NULL,
  `especialidad` VARCHAR(50) NOT NULL,
  `salario` INT NULL,
  `Persona_cedula` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`tarjetaProfesional`),
  INDEX `fk_Medico_Persona1_idx` (`Persona_cedula` ASC) VISIBLE,
  CONSTRAINT `fk_Medico_Persona1`
    FOREIGN KEY (`Persona_cedula`)
    REFERENCES `PortableHospital`.`Persona` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Autorizacion`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Autorizacion` (
  `idAutorizacion` INT NOT NULL AUTO_INCREMENT,
  `fechaAutorizacion` DATE NOT NULL,
  `idHistoriaClinica` INT NOT NULL,
  `Medico_tarjetaProfesional` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idAutorizacion`),
  INDEX `fk_Autorizacion_HistoriaClinica1_idx` (`idHistoriaClinica` ASC) VISIBLE,
  INDEX `fk_Autorizacion_Medico1_idx` (`Medico_tarjetaProfesional` ASC) VISIBLE,
  CONSTRAINT `fk_Autorizacion_HistoriaClinica1`
    FOREIGN KEY (`idHistoriaClinica`)
    REFERENCES `PortableHospital`.`HistoriaClinica` (`idHistoriaClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Autorizacion_Medico1`
    FOREIGN KEY (`Medico_tarjetaProfesional`)
    REFERENCES `PortableHospital`.`Medico` (`tarjetaProfesional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`OrdenMedica`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`OrdenMedica` (
  `idOrdenMedica` INT NOT NULL AUTO_INCREMENT,
  `tipoExamen` VARCHAR(100) NOT NULL,
  `idAutorizacion` INT NOT NULL,
  PRIMARY KEY (`idOrdenMedica`),
  INDEX `fk_OrdenMedica_Autorizacion1_idx` (`idAutorizacion` ASC) VISIBLE,
  CONSTRAINT `fk_OrdenMedica_Autorizacion1`
    FOREIGN KEY (`idAutorizacion`)
    REFERENCES `PortableHospital`.`Autorizacion` (`idAutorizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Interconsultas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Interconsultas` (
  `idInterconsultas` INT NOT NULL AUTO_INCREMENT,
  `observacion` VARCHAR(100) NOT NULL,
  `especialidad` VARCHAR(45) NOT NULL,
  `idAutorizacion` INT NOT NULL,
  PRIMARY KEY (`idInterconsultas`),
  INDEX `fk_Interconsultas_Autorizacion1_idx` (`idAutorizacion` ASC) VISIBLE,
  CONSTRAINT `fk_Interconsultas_Autorizacion1`
    FOREIGN KEY (`idAutorizacion`)
    REFERENCES `PortableHospital`.`Autorizacion` (`idAutorizacion`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Antecedentes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Antecedentes` (
  `idAntecedentes` INT NOT NULL AUTO_INCREMENT,
  `diagnostico` VARCHAR(100) NOT NULL,
  `idHistoriaClinica` INT NOT NULL,
  PRIMARY KEY (`idAntecedentes`),
  INDEX `fk_Antecedentes_HistoriaClinica1_idx` (`idHistoriaClinica` ASC) VISIBLE,
  CONSTRAINT `fk_Antecedentes_HistoriaClinica1`
    FOREIGN KEY (`idHistoriaClinica`)
    REFERENCES `PortableHospital`.`HistoriaClinica` (`idHistoriaClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Consulta`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Consulta` (
  `idConsulta` INT NOT NULL AUTO_INCREMENT,
  `fecha` DATE NOT NULL,
  `motivo` VARCHAR(100) NOT NULL,
  `enfermedadActual` VARCHAR(45) NOT NULL,
  `anamnesis` VARCHAR(150) NOT NULL,
  `diagnostico` VARCHAR(45) NOT NULL,
  `idHistoriaClinica` INT NOT NULL,
  `Medico_tarjetaProfesional` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idConsulta`),
  INDEX `fk_Consulta_HistoriaClinica_idx` (`idHistoriaClinica` ASC) VISIBLE,
  INDEX `fk_Consulta_Medico1_idx` (`Medico_tarjetaProfesional` ASC) VISIBLE,
  CONSTRAINT `fk_Consulta_HistoriaClinica`
    FOREIGN KEY (`idHistoriaClinica`)
    REFERENCES `PortableHospital`.`HistoriaClinica` (`idHistoriaClinica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Consulta_Medico1`
    FOREIGN KEY (`Medico_tarjetaProfesional`)
    REFERENCES `PortableHospital`.`Medico` (`tarjetaProfesional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Cita`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Cita` (
  `idCita` INT NOT NULL AUTO_INCREMENT,
  `fecha_cita` VARCHAR(20) NOT NULL,
  `Paciente_idPaciente` VARCHAR(30) NULL,
  `Medico_tarjetaProfesional` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`idCita`),
  INDEX `fk_Cita_Paciente1_idx` (`Paciente_idPaciente` ASC) VISIBLE,
  INDEX `fk_Cita_Medico1_idx` (`Medico_tarjetaProfesional` ASC) VISIBLE,
  CONSTRAINT `fk_Cita_Paciente1`
    FOREIGN KEY (`Paciente_idPaciente`)
    REFERENCES `PortableHospital`.`Paciente` (`idPaciente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Cita_Medico1`
    FOREIGN KEY (`Medico_tarjetaProfesional`)
    REFERENCES `PortableHospital`.`Medico` (`tarjetaProfesional`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Resultado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Resultado` (
  `idResultado` INT NOT NULL,
  `multimedia` VARCHAR(255) NULL,
  `texto` VARCHAR(255) NULL,
  `OrdenMedica_idOrdenMedica` INT NOT NULL,
  PRIMARY KEY (`idResultado`),
  INDEX `fk_Resultado_OrdenMedica1_idx` (`OrdenMedica_idOrdenMedica` ASC) VISIBLE,
  CONSTRAINT `fk_Resultado_OrdenMedica1`
    FOREIGN KEY (`OrdenMedica_idOrdenMedica`)
    REFERENCES `PortableHospital`.`OrdenMedica` (`idOrdenMedica`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Usuario` (
  `contrasena` VARCHAR(45) NOT NULL,
  `Persona_cedula` VARCHAR(20) NOT NULL,
  PRIMARY KEY (`Persona_cedula`),
  CONSTRAINT `fk_Usuario_Persona1`
    FOREIGN KEY (`Persona_cedula`)
    REFERENCES `PortableHospital`.`Persona` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`Rol`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`Rol` (
  `idRol` INT NOT NULL,
  `rol` VARCHAR(1) NOT NULL COMMENT 'A = Administrador\nP = Paciente\nL = laboratorista\nM = Medico',
  PRIMARY KEY (`idRol`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `PortableHospital`.`RolPersona`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `PortableHospital`.`RolPersona` (
  `idRolPersona` INT NOT NULL,
  `Persona_cedula` VARCHAR(20) NOT NULL,
  `Rol_idRol` INT NOT NULL,
  PRIMARY KEY (`idRolPersona`),
  INDEX `fk_RolPersona_Persona1_idx` (`Persona_cedula` ASC) VISIBLE,
  INDEX `fk_RolPersona_Rol1_idx` (`Rol_idRol` ASC) VISIBLE,
  CONSTRAINT `fk_RolPersona_Persona1`
    FOREIGN KEY (`Persona_cedula`)
    REFERENCES `PortableHospital`.`Persona` (`cedula`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_RolPersona_Rol1`
    FOREIGN KEY (`Rol_idRol`)
    REFERENCES `PortableHospital`.`Rol` (`idRol`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;
