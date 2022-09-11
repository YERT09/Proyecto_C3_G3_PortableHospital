package com.jta.model;

public class Cita {
String fecha_cita, idPaciente, tarjetaProfesional;

public Cita() {}

public Cita(String fecha_cita, String idPaciente, String tarjetaProfesional) {
	this.fecha_cita = fecha_cita;
	this.idPaciente = idPaciente;
	this.tarjetaProfesional = tarjetaProfesional;
}

public String getFecha_cita() {
	return fecha_cita;
}

public void setFecha_cita(String fecha_cita) {
	this.fecha_cita = fecha_cita;
}

public String getIdPaciente() {
	return idPaciente;
}

public void setIdPaciente(String idPaciente) {
	this.idPaciente = idPaciente;
}

public String getTarjetaProfesional() {
	return tarjetaProfesional;
}

public void setTarjetaProfesional(String tarjetaProfesional) {
	this.tarjetaProfesional = tarjetaProfesional;
}




}
