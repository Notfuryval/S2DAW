package model;

import java.math.BigDecimal;

public class Alojamiento {
    private int id;
    private String nombre;
    private String descripcion;
    private BigDecimal precioNoche;
    private int capacidad;
    private String imagen;
    private boolean destacado;
    private Localidad localidad;
    private Tipo tipo;

    public Alojamiento() {}

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }

    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getDescripcion() { return descripcion; }

    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public BigDecimal getPrecioNoche() { return precioNoche; }

    public void setPrecioNoche(BigDecimal precioNoche) { this.precioNoche = precioNoche; }

    public int getCapacidad() { return capacidad; }

    public void setCapacidad(int capacidad) { this.capacidad = capacidad; }

    public String getImagen() { return imagen; }

    public void setImagen(String imagen) { this.imagen = imagen; }

    public boolean isDestacado() { return destacado; }

    public void setDestacado(boolean destacado) { this.destacado = destacado; }

    public Localidad getLocalidad() { return localidad; }

    public void setLocalidad(Localidad localidad) { this.localidad = localidad; }

    public Tipo getTipo() { return tipo; }

    public void setTipo(Tipo tipo) { this.tipo = tipo; }
}
