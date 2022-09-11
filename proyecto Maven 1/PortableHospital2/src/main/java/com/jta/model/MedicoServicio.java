package com.jta.model;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.jta.dao.MedicoDao;

@Path("/medico")
public class MedicoServicio {
	
@POST
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public String guardarMedico(Medico medico) {
	String mensaje = "";
	
	int estadoMedico = MedicoDao.nuevoMedico(medico);
	if(estadoMedico!=0) {
		mensaje = "Medico creado";
	}else {
		mensaje = "No se pudo crear el medico";
	}
	
	return mensaje;
}
}
