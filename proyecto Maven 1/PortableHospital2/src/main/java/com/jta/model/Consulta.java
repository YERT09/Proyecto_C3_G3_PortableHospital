package com.jta.model;
import java.sql.Date;
import java.time.LocalDate;

public class Consulta {
	private int idHistoriaClinica;
	private String motivo, enfermedadActual, anamnesis, diagnostico, tarjetaProfesional;
	private String fecha;
	
	public Consulta() {}
	
	public Consulta(String fecha, String motivo, String enfermedadActual, String anamnesis,
			String diagnostico, int idHistoriaClinica, String tarjetaProfesional) {
			this.idHistoriaClinica = idHistoriaClinica;
			this.motivo = motivo;
			this.enfermedadActual = enfermedadActual;
			this.anamnesis = anamnesis;
			this.diagnostico = diagnostico;
			this.tarjetaProfesional = tarjetaProfesional;
			this.fecha = fecha;
		}
	/*
	public Consulta(int idConsulta,String fecha, String motivo, String enfermedadActual, String anamnesis,
			String diagnostico, int idHistoriaClinica, String tarjetaProfesional) {
		this.idConsulta = idConsulta;
		this.idHistoriaClinica = idHistoriaClinica;
		this.motivo = motivo;
		this.enfermedadActual = enfermedadActual;
		this.anamnesis = anamnesis;
		this.diagnostico = diagnostico;
		this.tarjetaProfesional = tarjetaProfesional;
		this.fecha = fecha;
	}
	*/

	

	public int getIdHistoriaClinica() {
		return idHistoriaClinica;
	}
	public void setIdHistoriaClinica(int idHistoriaClinica) {
		this.idHistoriaClinica = idHistoriaClinica;
	}

	public void setMotivo(String motivo) {
		this.motivo = motivo;
	}

	public void setEnfermedadActual(String enfermedadActual) {
		this.enfermedadActual = enfermedadActual;
	}

	public void setAnamnesis(String anamnesis) {
		this.anamnesis = anamnesis;
	}

	public void setDiagnostico(String diagnostico) {
		this.diagnostico = diagnostico;
	}

	public void settarjetaProfesional(String tarjetaProfesional) {
		this.tarjetaProfesional = tarjetaProfesional;
	}

	public void setFecha(String fecha) {
		this.fecha = fecha;
	}

	public String getMotivo() {
		return motivo;
	}
	public String getEnfermedadActual() {
		return enfermedadActual;
	}
	public String getAnamnesis() {
		return anamnesis;
	}
	public String getDiagnostico() {
		return diagnostico;
	}
	public String getTarjetaProfesional() {
		return tarjetaProfesional;
	}
	public String getFecha() {
		return fecha;
	}
	
}
