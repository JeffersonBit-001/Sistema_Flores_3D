/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JEFFERSON
 */
public class Decorativos {
    private int id_decorativo;
    private String nombre_decorativo;
    private String descripcion;
    private int stock;
    private float precio;
    private String img_3d;

    public Decorativos() {
    }

    public Decorativos(int id_decorativo, String nombre_decorativo, String descripcion, int stock, float precio, String img_3d) {
        this.id_decorativo = id_decorativo;
        this.nombre_decorativo = nombre_decorativo;
        this.descripcion = descripcion;
        this.stock = stock;
        this.precio = precio;
        this.img_3d = img_3d;
    }

    public int getId_decorativo() {
        return id_decorativo;
    }

    public void setId_decorativo(int id_decorativo) {
        this.id_decorativo = id_decorativo;
    }

    public String getNombre_decorativo() {
        return nombre_decorativo;
    }

    public void setNombre_decorativo(String nombre_decorativo) {
        this.nombre_decorativo = nombre_decorativo;
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
