/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JEFFERSON
 */
public class Cliente extends Persona{
    
    private int id_pedido;

    public Cliente() {
    }

    public Cliente(int id_pedido) {
        this.id_pedido = id_pedido;
    }

    public Cliente(int id_pedido, int id, String nombre, String apellido_paterno, String apellido_materno) {
        super(id, nombre, apellido_paterno, apellido_materno);
        this.id_pedido = id_pedido;
    }

    public int getId_pedido() {
        return id_pedido;
    }

    public void setId_pedido(int id_pedido) {
        this.id_pedido = id_pedido;
    }
    
    
    
    
}
