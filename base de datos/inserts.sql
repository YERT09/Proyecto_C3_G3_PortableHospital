--Paciente
INSERT INTO Eps (`idEps`,`nombre`) VALUES ('1','cosmite');
INSERT INTO Persona (`cedula`,`nombre`,`fecha_nacimiento`,`direccion`,`telefono`,`email`) VALUES ('123','ande','2022-09-08','asdasd','123','aaa');

INSERT INTO Paciente (`idPaciente`,`fecha_ingreso`,`fecha_alta`,`Persona_cedula`,`Eps_idEps`) VALUES ('1','2022-09-08','2022-09-08','123','1');
--Medico
INSERT INTO Persona (`cedula`,`nombre`,`fecha_nacimiento`,`direccion`,`telefono`,`email`) VALUES ('testmedico','valentina','2022-09-08','ajsdhaskjdh','321','bbb');