package com.jta.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

import com.jta.model.Conexion;
import com.jta.model.Consulta;

public class ConsultaDao {
    private static ResultSet setResultados;
    private static PreparedStatement ps;
    
    public static int nuevaConsulta(Consulta consulta) {
    	int estadoConsulta = 0;//0 es que ha fallado
    	Connection con = Conexion.conector();
    	
        LocalDate localDate = LocalDate.parse(consulta.getFecha(), DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        Date fecha = Date.valueOf(localDate);
    	String motivo = consulta.getMotivo();
    	String enfermedadActual = consulta.getEnfermedadActual();
    	String anamnesis = consulta.getAnamnesis();
    	String diagnostico = consulta.getDiagnostico();
    	int idHistoriaClinica = consulta.getIdHistoriaClinica();
    	String tarjetaProfesional = consulta.getTarjetaProfesional();
    

    	
    	try {
            String sentenciaSql = "INSERT INTO CONSULTA(fecha, motivo, enfermedadActual, anamnesis, diagnostico, idHistoriaClinica, Medico_tarjetaProfesional) VALUES (?,?, ?, ?, ?, ?, ?)";
            
            ps = con.prepareStatement(sentenciaSql);
            ps.setDate(1, fecha);
            ps.setString(2, motivo);
            ps.setString(3, enfermedadActual);
            ps.setString(4, anamnesis);
            ps.setString(5, diagnostico);
            ps.setInt(6, idHistoriaClinica);
            ps.setString(7, tarjetaProfesional);
            
            int res = ps.executeUpdate();
            
            if(res>0){
            	estadoConsulta = 1;
                System.out.println("Se ha creado una consulta");
            }

    	}catch (Exception e) {
            System.out.println("Error al crear una consulta: "+e);
		}finally{
            try {
                Conexion.closeConector();
                ps.close();
            } catch (SQLException ex) {
                System.out.println("error al cerrar el preparedStatement o Conexion "+ex.getMessage());
            }
        }
    	
    	return estadoConsulta;
    }
}
