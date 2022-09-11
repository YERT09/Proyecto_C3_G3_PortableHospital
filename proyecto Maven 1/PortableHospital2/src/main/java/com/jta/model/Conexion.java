package com.jta.model;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author AndresDavid
 */
public class Conexion {
        // Declaramos la conexion a mysql
    private static Connection con;
    // Declaramos los datos de conexion a la bd
    private static final String driver="com.mysql.jdbc.Driver";
    private static final String user="admin1";
    private static final String pass="Secret*12345";
    public static final String bd="PortableHospital";
    private static final String url="jdbc:mysql://127.0.0.1:3306/"+bd+"?enabledTLSProtocols=TLSv1.2&useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";

    
    
    // Funcion que va conectarse a mi bd de mysql
    public static Connection conector() {
        // Reseteamos a null la conexion a la bd
        con=null;
        try{
            Class.forName(driver);
            // Nos conectamos a la bd
            con= (Connection) DriverManager.getConnection(url, user, pass);
            // Si la conexion fue exitosa mostramos un mensaje de conexion exitosa
            if (con!=null){
                System.out.println("Conexion establecida");
            }
        }
        // Si la conexion NO fue exitosa mostramos un mensaje de error
        catch(Exception e) {
        	System.out.println("ERROR DE CONEXION CON LA BD "+e);
        }
        return con;
    }
    
    public static void closeConector(){
        if(con!=null){
            try {
                con.close();
            } catch (SQLException ex) {
                Logger.getLogger(Conexion.class.getName()).log(Level.SEVERE, null, ex);
            }
        }
    }
}