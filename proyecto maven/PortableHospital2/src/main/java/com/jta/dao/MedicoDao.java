package com.jta.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jta.model.Conexion;
import com.jta.model.Medico;

public class MedicoDao {
	   private static ResultSet setResultados;
	    private static PreparedStatement ps;
	    
	    public static int nuevoMedico(Medico medico) {
	    	int estadoMedico = 0;//0 es que ha fallado
	    	Connection con = Conexion.conector();
	    	
	    	String tarjetaProfesional = medico.getTarjetaProfesional();
	    	String especialidad = medico.getEspecialidad();
	    	int salario = medico.getSalario();
	    	String cedulaPersona = medico.getCedulaPersona();

	    	try {
	            String sentenciaSql = "INSERT INTO MEDICO(tarjetaProfesional, especialidad, salario, Persona_cedula) VALUES (?,?, ?, ?)";
	            
	            ps = con.prepareStatement(sentenciaSql);
	            ps.setString(1, tarjetaProfesional);
	            ps.setString(2, especialidad);
	            ps.setInt(3, salario);
	            ps.setString(4, cedulaPersona);

	            int res = ps.executeUpdate();
	            
	            if(res>0){
	            	estadoMedico = 1;
	                System.out.println("Se ha creado un medico");
	            }

	    	}catch (Exception e) {
	            System.out.println("Error al crear un medico: "+e);
			}finally{
	            try {
	                Conexion.closeConector();
	                ps.close();
	            } catch (SQLException ex) {
	                System.out.println("error al cerrar el preparedStatement o Conexion "+ex.getMessage());
	            }
	        }
	    	
	    	return estadoMedico;
	    }
}
