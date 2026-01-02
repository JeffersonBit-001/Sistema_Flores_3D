/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Conexion.ConexionBD;
import Modelo.Colores;
import Modelo.Decorativos;
import Modelo.Detalles_Colores;
import Modelo.Floreros;
import Modelo.Flores;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JEFFERSON
 */
public class Detalles_Colores_DAO extends ConexionBD{
    
    
    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public ArrayList<Detalles_Colores> obtenerDetalesColorFlores() {
        ArrayList<Detalles_Colores> color = new ArrayList<>();
        String sql = "select nombre_flor, nombre_color, col.codigo_color from detalle_color_flores det\n" +
"                    inner join flores fl\n" +
"                    on det.id_flor = fl.id_flor\n" +
"                    inner join colores col \n" +
"                    on det.id_color = col.id_color";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Detalles_Colores detalle = new Detalles_Colores();
                
                detalle.setFlores(new Flores(0,rs.getString("nombre_flor"),
                        "","",0,0,""));
                
                
                detalle.setColores(new Colores(0,rs.getString("nombre_color"), 
                        rs.getString("codigo_color")));
               
                
                color.add(detalle);
            }

        } catch (SQLException e) {
            System.out.println("");
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }

                if (rs != null) {
                    rs.close();
                }

                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {

            }
        }
        return color;
    }
    
    
    
    public ArrayList<Detalles_Colores> obtenerDetalesColorFlorero() {
        ArrayList<Detalles_Colores> color = new ArrayList<>();
        String sql = "select fl.nombre nombre_florero, col.nombre_color, col.codigo_color \n" +
                    "  from detalle_color_floreros det\n" +
                    "inner join floreros fl\n" +
                    "on det.id_florero = fl.id_florero\n" +
                    "inner join colores col\n" +
                    "on det.id_color = col.id_color";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Detalles_Colores detalle = new Detalles_Colores();
                
                detalle.setFloreros(new Floreros(rs.getString("nombre_florero")));
                
                
                detalle.setColores(new Colores(0,rs.getString("nombre_color"), 
                        rs.getString("codigo_color")));
               
                
                color.add(detalle);
            }

        } catch (SQLException e) {
            System.out.println("");
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }

                if (rs != null) {
                    rs.close();
                }

                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {

            }
        }
        return color;
    }
    
    
    
    
    
     public ArrayList<Detalles_Colores> obtenerDetalesColorDecorativos() {
        ArrayList<Detalles_Colores> color = new ArrayList<>();
        String sql = "select dt.nombre nombre_decorativo, col.nombre_color, col.codigo_color \n" +
                    "  from detalle_color_decorativos det\n" +
                    "inner join decorativos dt\n" +
                    "on det.id_decorativo = dt.id_decorativo\n" +
                    "inner join colores col\n" +
                    "on det.id_color = col.id_color";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Detalles_Colores detalle = new Detalles_Colores();
                
                detalle.setDecorativos(new Decorativos(0, rs.getString("nombre_decorativo"), 
                        "", 0, 0, ""));
                
                
                detalle.setColores(new Colores(0,rs.getString("nombre_color"), 
                        rs.getString("codigo_color")));
               
                
                color.add(detalle);
            }

        } catch (SQLException e) {
            System.out.println("");
        } finally {
            try {
                if (cn != null) {
                    cn.close();
                }

                if (rs != null) {
                    rs.close();
                }

                if (ps != null) {
                    ps.close();
                }
            } catch (SQLException e) {

            }
        }
        return color;
    }
    
    
    
    
    
    
    
    
    
    
    
    
}
