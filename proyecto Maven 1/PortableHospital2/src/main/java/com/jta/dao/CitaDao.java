package com.jta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.jta.model.Cita;
import com.jta.model.Conexion;

public class CitaDao {
    private static ResultSet setResultados;
    private static PreparedStatement ps;
    
    public static int nuevaCita(Cita cita) {
    	int estadoCita= 0;//0 es que ha fallado
    	Connection con = Conexion.conector();
    	
    	String fecha = cita.getFecha_cita();
    	String idPaciente = cita.getIdPaciente();
    	String tarjetaProfesional = cita.getTarjetaProfesional();
    	

    	try {
            String sentenciaSql = "INSERT INTO CITA(fecha_cita, Paciente_idPaciente, Medico_tarjetaProfesional) VALUES (?,?, ?)";
            
            ps = con.prepareStatement(sentenciaSql);
            ps.setString(1, fecha);
            ps.setString(2, idPaciente);
            ps.setString(3, tarjetaProfesional);

            
            int res = ps.executeUpdate();
            
            if(res>0){
            	estadoCita = 1;
                System.out.println("Se ha creado una cita");
            }

    	}catch (Exception e) {
            System.out.println("Error al crear una cita: "+e);
		}finally{
            try {
                Conexion.closeConector();
                ps.close();
            } catch (SQLException ex) {
                System.out.println("error al cerrar el preparedStatement o Conexion "+ex.getMessage());
            }
        }
    	
    	return estadoCita;
    }
}
