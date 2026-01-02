/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Conexion;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author JEFFERSON
 */
public class ConexionBD {
    
    public static Connection getConexion(){
        Connection cnx = null;

        String url = "jdbc:mysql://localhost:3306/db_flores_personalizacion?useTimeZone=true&"
                + "serverTimezone=UTC&autoReconnect=true";

        String user = "root";
        String clave = "root";

        String Driver = "com.mysql.cj.jdbc.Driver";

        
        try {
            Class.forName(Driver);
            cnx = DriverManager.getConnection(url, user, clave);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        } catch (SQLException ex) {
            Logger.getLogger(ConexionBD.class.getName()).log(Level.SEVERE, null, ex);
        }
            return cnx;
    }
    
    
    
    public static void main (String[] args) throws SQLException{
        Connection cnx=new ConexionBD().getConexion();
        System.out.println(""+cnx.getCatalog());
    }
    
}
