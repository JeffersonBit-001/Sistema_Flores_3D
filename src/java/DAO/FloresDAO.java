/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Conexion.ConexionBD;
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
public class FloresDAO {
    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public ArrayList<Flores> obtenerFlores() {
        ArrayList<Flores> flor = new ArrayList<>();
        String sql = "select * from flores";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Flores flore = new Flores();
                flore.setId_flor(rs.getInt("id_flor"));
                flore.setNombre_flor(rs.getString("nombre_flor"));
                flore.setNombre_cientifico(rs.getString("nombre_cientifico"));
                flore.setDescripcion(rs.getString("descripcion"));
                flore.setStock(rs.getInt("stock"));
                flore.setPrecio(rs.getFloat("precio"));
                flore.setImg_3d(rs.getString("img_3d"));
                flor.add(flore);
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
        return flor;
    }
}
