package com.jta.model;


public class Medico {
String tarjetaProfesional, especialidad, cedulaPersona;
int salario;

public Medico() {}

public Medico(String tarjetaProfesional, String especialidad, String cedulaPersona, int salario) {
	this.tarjetaProfesional = tarjetaProfesional;
	this.especialidad = especialidad;
	this.cedulaPersona = cedulaPersona;
	this.salario = salario;
}

public String getTarjetaProfesional() {
	return tarjetaProfesional;
}
public void setTarjetaProfesional(String tarjetaProfesional) {
	this.tarjetaProfesional = tarjetaProfesional;
}
public String getEspecialidad() {
	return especialidad;
}
public void setEspecialidad(String especialidad) {
	this.especialidad = especialidad;
}
public String getCedulaPersona() {
	return cedulaPersona;
}
public void setCedulaPersona(String cedulaPersona) {
	this.cedulaPersona = cedulaPersona;
}
public int getSalario() {
	return salario;
}
public void setSalario(int salario) {
	this.salario = salario;
}



}
