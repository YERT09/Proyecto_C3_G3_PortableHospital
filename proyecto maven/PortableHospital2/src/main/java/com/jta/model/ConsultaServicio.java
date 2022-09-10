package com.jta.model;

import javax.ws.rs.Consumes;
import javax.ws.rs.POST;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.jta.dao.ConsultaDao;

@Path("/consulta")
public class ConsultaServicio {
	
@POST
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
public String guardarConsulta(Consulta consulta) {
	String mensaje = "";
	
	int estadoConsulta = ConsultaDao.nuevaConsulta(consulta);
	if(estadoConsulta!=0) {
		mensaje = "Consulta creada";
	}else {
		mensaje = "No se pudo crear la consulta";
	}
	
	return mensaje;
}
}
