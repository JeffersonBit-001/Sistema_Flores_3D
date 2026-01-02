/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JEFFERSON
 */
public class Flores {
    private int id_flor;
    private String nombre_flor;
    private String nombre_cientifico;
    private String descripcion;
    private int stock;
    private float precio;
    private String img_3d;

    public Flores() {
    }

    public Flores(int id_flor, String nombre_flor, String nombre_cientifico, String descripcion, int stock, float precio, String img_3d) {
        this.id_flor = id_flor;
        this.nombre_flor = nombre_flor;
        this.nombre_cientifico = nombre_cientifico;
        this.descripcion = descripcion;
        this.stock = stock;
        this.precio = precio;
        this.img_3d = img_3d;
    }

    public String getImg_3d() {
        return img_3d;
    }

    public void setImg_3d(String img_3d) {
        this.img_3d = img_3d;
    }

    public int getId_flor() {
        return id_flor;
    }

    public void setId_flor(int id_flor) {
        this.id_flor = id_flor;
    }

    public String getNombre_flor() {
        return nombre_flor;
    }

    public void setNombre_flor(String nombre_flor) {
        this.nombre_flor = nombre_flor;
    }

    public String getNombre_cientifico() {
        return nombre_cientifico;
    }

    public void setNombre_cientifico(String nombre_cientifico) {
        this.nombre_cientifico = nombre_cientifico;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public float getPrecio() {
        return precio;
    }

    public void setPrecio(float precio) {
        this.precio = precio;
    }
    
    
    
    
    
    
    
}
