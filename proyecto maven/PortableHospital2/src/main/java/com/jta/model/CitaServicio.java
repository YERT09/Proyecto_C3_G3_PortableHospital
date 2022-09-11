package com.jta.model;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.jta.dao.CitaDao;

@Path("/cita")
public class CitaServicio {
	
@POST
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public String guardarCita(Cita cita) {
	String mensaje = "";
	
	int estadoCita = CitaDao.nuevaCita(cita);
	if(estadoCita!=0) {
		mensaje = "Cita creada";
	}else {
		mensaje = "No se pudo crear la cita";
	}
	
	return mensaje;
}
}
