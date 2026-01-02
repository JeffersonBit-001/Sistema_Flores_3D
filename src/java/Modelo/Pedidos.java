/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

import java.util.ArrayList;

/**
 *
 * @author JEFFERSON
 */
public class Pedidos {
    
    private int id;
    private int id_pedido;
    private int id_cliente;
    private int id_usuario;
    private String fecha_pedido;
    private int id_estado;
    private int cantidad;
    private String id_personalizado;
    private double precio_individual;
    
    
    
    private Administrador adm;
    
    private ArrayList<Flores> arrayFlores;
    
    private Decorativos decorativo;
    
    private Floreros florero;
    
    private String notas_especiales;
    
    private float precio_total;

    public Pedidos() {
    }

    public Pedidos(int id, int id_pedido, int id_cliente, int id_usuario, String fecha_pedido, int id_estado, int cantidad, String id_personalizado, double precio_individual, Administrador adm, ArrayList<Flores> arrayFlores, Decorativos decorativo, Floreros florero, String notas_especiales, float precio_total) {
        this.id = id;
        this.id_pedido = id_pedido;
        this.id_cliente = id_cliente;
        this.id_usuario = id_usuario;
        this.fecha_pedido = fecha_pedido;
        this.id_estado = id_estado;
        this.cantidad = cantidad;
        this.id_personalizado = id_personalizado;
        this.precio_individual = precio_individual;
        this.adm = adm;
        this.arrayFlores = arrayFlores;
        this.decorativo = decorativo;
        this.florero = florero;
        this.notas_especiales = notas_especiales;
        this.precio_total = precio_total;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public int getId_cliente() {
        return id_cliente;
    }

    public void setId_cliente(int id_cliente) {
        this.id_cliente = id_cliente;
    }

    public int getId_usuario() {
        return id_usuario;
    }

    public void setId_usuario(int id_usuario) {
        this.id_usuario = id_usuario;
    }

    public String getFecha_pedido() {
        return fecha_pedido;
    }

    public void setFecha_pedido(String fecha_pedido) {
        this.fecha_pedido = fecha_pedido;
    }

    public int getId_estado() {
        return id_estado;
    }

    public void setId_estado(int id_estado) {
        this.id_estado = id_estado;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public String getId_personalizado() {
        return id_personalizado;
    }

    public void setId_personalizado(String id_personalizado) {
        this.id_personalizado = id_personalizado;
    }

    public double getPrecio_individual() {
        return precio_individual;
    }

    public void setPrecio_individual(double precio_individual) {
        this.precio_individual = precio_individual;
    }

    public Administrador getAdm() {
        return adm;
    }

    public void setAdm(Administrador adm) {
        this.adm = adm;
    }

    public ArrayList<Flores> getArrayFlores() {
        return arrayFlores;
    }

    public void setArrayFlores(ArrayList<Flores> arrayFlores) {
        this.arrayFlores = arrayFlores;
    }

    public Decorativos getDecorativo() {
        return decorativo;
    }

    public void setDecorativo(Decorativos decorativo) {
        this.decorativo = decorativo;
    }

    public Floreros getFlorero() {
        return florero;
    }

    public void setFlorero(Floreros florero) {
        this.florero = florero;
    }

    public String getNotas_especiales() {
        return notas_especiales;
    }

    public void setNotas_especiales(String notas_especiales) {
        this.notas_especiales = notas_especiales;
    }

    public float getPrecio_total() {
        return precio_total;
    }

    public void setPrecio_total(float precio_total) {
        this.precio_total = precio_total;
    }

    
    
    
    

    
    
}
