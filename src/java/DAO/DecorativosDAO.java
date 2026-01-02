/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Conexion.ConexionBD;
import Modelo.Decorativos;
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
public class DecorativosDAO {
    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public ArrayList<Decorativos> obtenerDecorativos() {
        ArrayList<Decorativos> decora = new ArrayList<>();
        String sql = "select * from decorativos";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Decorativos dec = new Decorativos();
                dec.setId_decorativo(rs.getInt("id_decorativo"));
                dec.setNombre_decorativo(rs.getString("nombre"));
                dec.setDescripcion(rs.getString("descripcion"));
                dec.setStock(rs.getInt("stock"));
                dec.setPrecio(rs.getFloat("precio"));
                dec.setImg_3d(rs.getString("img_3d"));
                decora.add(dec);
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
        return decora;
    }
}