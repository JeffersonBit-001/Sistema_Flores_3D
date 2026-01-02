/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Modelo;

/**
 *
 * @author JEFFERSON
 */
public class Detalles_Colores {
    
    private Flores flores;
    private Floreros floreros;
    private Decorativos decorativos;
    private Colores colores;

    public Detalles_Colores() {
    }

    public Detalles_Colores(Flores flores, Floreros floreros, Decorativos decorativos, Colores colores) {
        this.flores = flores;
        this.floreros = floreros;
        this.decorativos = decorativos;
        this.colores = colores;
    }

    public Colores getColores() {
        return colores;
    }

    public void setColores(Colores colores) {
        this.colores = colores;
    }

    public Flores getFlores() {
        return flores;
    }

    public void setFlores(Flores flores) {
        this.flores = flores;
    }

    public Floreros getFloreros() {
        return floreros;
    }

    public void setFloreros(Floreros floreros) {
        this.floreros = floreros;
    }

    public Decorativos getDecorativos() {
        return decorativos;
    }

    public void setDecorativos(Decorativos decorativos) {
        this.decorativos = decorativos;
    }
    
    
    
    
    
    
}
