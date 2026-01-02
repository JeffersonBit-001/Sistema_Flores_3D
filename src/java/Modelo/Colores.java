/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JEFFERSON
 */
public class Colores {
    private int id_color;
    private String nombre_color;
    private String codigo_color;

    public Colores() {
    }

    public Colores(int id_color, String nombre_color, String codigo_color) {
        this.id_color = id_color;
        this.nombre_color = nombre_color;
        this.codigo_color = codigo_color;
    }

    public String getCodigo_color() {
        return codigo_color;
    }

    public void setCodigo_color(String codigo_color) {
        this.codigo_color = codigo_color;
    }

    public int getId_color() {
        return id_color;
    }

    public void setId_color(int id_color) {
        this.id_color = id_color;
    }

    public String getNombre_color() {
        return nombre_color;
    }

    public void setNombre_color(String nombre_color) {
        this.nombre_color = nombre_color;
    }

    
    
    
}
