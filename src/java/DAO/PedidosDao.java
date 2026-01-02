/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package DAO;

import Conexion.ConexionBD;
import Modelo.Cliente;
import Modelo.Flores;
import Modelo.Pedidos;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author JEFFERSON
 */
public class PedidosDao {

    private Connection cn = null;

    private PreparedStatement ps = null;
    private ResultSet rs = null;

    public void insertarPedido(int id_cliente, float precio_total) {
        String sql = "insert into pedido (id_cliente, precio_total) values (?,?)";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id_cliente);
            ps.setFloat(2, precio_total);

            ps.executeUpdate();
            

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
        
    }
    
    
    
    public Cliente recuperarPedido(int id_cliente) {
        
        Cliente cl = new Cliente();
        String sql = "select ped.id_pedido, cl.nombre, cl.apellido_paterno,cl.apellido_materno from\n" +
                    " pedido  ped\n" +
                    " inner join clientes cl \n" +
                    " on ped.id_cliente = cl.id_cliente\n" +
                    " where cl.id_cliente = ? and ped.id_estado = ?";
        int id = 0;
        
        
        try {
            
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id_cliente);
            ps.setInt(2, 1);
            rs = ps.executeQuery();
            
                        
            
            if (rs.next()){
                
                cl.setId_pedido(rs.getInt("id_pedido"));
                cl.setNombre(rs.getString("nombre"));
                cl.setApellido_paterno("apellido_paterno");
                cl.setApellido_materno("apellido_materno");
                
                
                
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
        return cl;
    }
    
    
    
    public String insertarPedidoMongo(int id_pedido, String id_mongo, int cantidad, float precio_total) {
        String sql = "insert into detalle_pedidos_personalizado_mongo ("
                + "id_pedido, id_arreglo_personalizado,cantidad, precio) values (?,?,?,?)";

        String var = "";
        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            ps.setInt(1, id_pedido);
            ps.setString(2, id_mongo);
            ps.setInt(3, cantidad);
            ps.setFloat(4, precio_total);

            ps.executeUpdate();
            
            var = "";
        } catch (SQLException e) {
            System.out.println("");
            var = "error : "+ e;
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
        
    return var;
    }
    
    
    
    public ArrayList<Pedidos> obtenerPedido() {
        ArrayList<Pedidos> pedido = new ArrayList<>();
        String sql = "select * from detalle_pedidos_personalizado_mongo";

        try {
            cn = ConexionBD.getConexion();
            ps = cn.prepareStatement(sql);
            rs = ps.executeQuery();

            while (rs.next()) {
                Pedidos ped = new Pedidos();
                ped.setId(rs.getInt("id_detalle_pedido_personalizado_mongo"));
                ped.setId_pedido(rs.getInt("id_pedido"));
                ped.setId_personalizado(rs.getString("id_arreglo_personalizado"));
                ped.setCantidad(rs.getInt("cantidad"));
                ped.setPrecio_individual(rs.getFloat("precio"));
                pedido.add(ped);
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
        return pedido;
    }
    
    
    
}
