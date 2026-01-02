/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JEFFERSON
 */
public class Floreros {
    
    private int id_florero;
    private String nombre_florero;
    private String descripcion;
    private int stock;
    private float precio;
    private String img_3d;

    public Floreros(int id_florero, String nombre_florero, String descripcion, int stock, float precio, String img_3d) {
        this.id_florero = id_florero;
        this.nombre_florero = nombre_florero;
        this.descripcion = descripcion;
        this.stock = stock;
        this.precio = precio;
        this.img_3d = img_3d;
    }

    public Floreros(String nombre_florero) {
        this.nombre_florero = nombre_florero;
    }
    

    public Floreros() {
    }

    public int getId_florero() {
        return id_florero;
    }

    public void setId_florero(int id_florero) {
        this.id_florero = id_florero;
    }

    public String getNombre_florero() {
        return nombre_florero;
    }

    public void setNombre_florero(String nombre_florero) {
        this.nombre_florero = nombre_florero;
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

    public String getImg_3d() {
        return img_3d;
    }

    public void setImg_3d(String img_3d) {
        this.img_3d = img_3d;
    }

    
    
    
    
}
