/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.PedidosDao;
import Modelo.Cliente;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author JEFFERSON
 */
@WebServlet(name = "ControladorPedidos", urlPatterns = {"/ControladorPedidos"})
public class ControladorPedidos extends HttpServlet {

    PedidosDao pedidos = new PedidosDao();

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String val = request.getParameter("val");
        float precio_total = Float.parseFloat(request.getParameter("precio_total"));

        int id_cliente = 2;
        
        
        
        
        

        if (val != null) {

            switch (val) {
                case "insertarPedido":
                    Cliente cl = new Cliente();
                    pedidos.insertarPedido(id_cliente, precio_total);
                    cl = pedidos.recuperarPedido(id_cliente);

                    //insertar detalle de pedido
                    response.setContentType("application/json;charset=UTF-8");

                    String conseguirPedido = new Gson().toJson(cl);
                    response.getWriter().println(conseguirPedido);

                    break;

                case "insertarPedidoMongo":
                    String id_mongo = request.getParameter("id_mongo");
                    int id_pedido = Integer.parseInt(request.getParameter("id_pedido"));
                    int cantidad = Integer.parseInt(request.getParameter("cantidad"));
                    precio_total = Float.parseFloat(request.getParameter("precio_total"));
                    
                    
                    pedidos.insertarPedidoMongo(id_pedido, id_mongo, cantidad, precio_total);

                    //insertar detalle de pedido
                    response.setContentType("application/json;charset=UTF-8");

                    String conseguirPedido2 = new Gson().toJson("mongo insertado");
                    response.getWriter().println(conseguirPedido2);
                    
                    
                    break;

            }
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
