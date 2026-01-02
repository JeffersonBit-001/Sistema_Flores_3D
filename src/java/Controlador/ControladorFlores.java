/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import DAO.DecorativosDAO;
import DAO.Detalles_Colores_DAO;
import DAO.FloreroDAO;
import DAO.FloresDAO;
import Modelo.Decorativos;
import Modelo.Detalles_Colores;
import Modelo.Floreros;
import Modelo.Flores;
import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import sun.font.Decoration;

/**
 *
 * @author JEFFERSON
 */
@WebServlet("/ControladorFlores")
public class ControladorFlores extends HttpServlet {
    FloresDAO florDao= new FloresDAO();
    FloreroDAO florereoDAO = new FloreroDAO();
    DecorativosDAO decorativoDAO = new DecorativosDAO();
    Detalles_Colores_DAO detColorDao = new Detalles_Colores_DAO();
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
        
        
        String tipoc = request.getParameter("tipoc");
        
        if (tipoc != null){
            
            switch (tipoc) {
                case "mostrar_flores":
                    ArrayList<Flores> tipo = florDao.obtenerFlores();

                    response.setContentType("application/json;charset=UTF-8");
                    String conseguirFlores = new Gson().toJson(tipo);
                    response.getWriter().println(conseguirFlores);
                    
                    break;
                    
                case "mostrar_florero":
                    
                    ArrayList<Floreros> tipoF = florereoDAO.obtenerFlorero();

                    response.setContentType("application/json;charset=UTF-8");
                    String conseguirFlorero = new Gson().toJson(tipoF);
                    response.getWriter().println(conseguirFlorero);
                    
                    break;
                
                case "mostrar_decorativo":
                    
                    ArrayList<Decorativos> tipoD = decorativoDAO.obtenerDecorativos();

                    response.setContentType("application/json;charset=UTF-8");
                    String conseguirDecorativo = new Gson().toJson(tipoD);
                    response.getWriter().println(conseguirDecorativo);
                    
                    break;
                    
                    
                case "mostrar_color":
                    
                    ArrayList<Detalles_Colores> tipoDC = detColorDao.obtenerDetalesColorFlores();

                    response.setContentType("application/json;charset=UTF-8");
                    String conseguirDetColor = new Gson().toJson(tipoDC);
                    response.getWriter().println(conseguirDetColor);
                    
                    break;
                    
                    
                case "mostrar_color_florero":
                    
                    ArrayList<Detalles_Colores> tipoDCF = detColorDao.obtenerDetalesColorFlorero();

                    response.setContentType("application/json;charset=UTF-8");
                    String conseguirDetColorFlorero = new Gson().toJson(tipoDCF);
                    response.getWriter().println(conseguirDetColorFlorero);
                    
                    break;
                    
               case "mostrar_color_decorativo":
                    
                    ArrayList<Detalles_Colores> tipoDCV = detColorDao.obtenerDetalesColorDecorativos();

                    response.setContentType("application/json;charset=UTF-8");
                    String conseguirDetColorDecorativo = new Gson().toJson(tipoDCV);
                    response.getWriter().println(conseguirDetColorDecorativo);
                    
                    break;
                    
                case "qwe":
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
