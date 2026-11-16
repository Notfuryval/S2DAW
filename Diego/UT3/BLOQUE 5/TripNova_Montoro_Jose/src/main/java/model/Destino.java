package model;

import java.math.BigDecimal;

public class Destino {
    private int id;
    private String nombre;
    private String pais;
    private String descripcion;
    private BigDecimal precioDesde;
    private int dias;
    private String imagen;
    private boolean destacado;
    private TipoDestino tipo;

    public Destino() {}

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getNombre() { return nombre; }

    public void setNombre(String nombre) { this.nombre = nombre; }

    public String getPais() { return pais; }

    public void setPais(String pais) { this.pais = pais; }

    public String getDescripcion() { return descripcion; }

    public void setDescripcion(String descripcion) { this.descripcion = descripcion; }

    public BigDecimal getPrecioDesde() { return precioDesde; }

    public void setPrecioDesde(BigDecimal precioDesde) { this.precioDesde = precioDesde; }

    public int getDias() { return dias; }

    public void setDias(int dias) { this.dias = dias; }

    public String getImagen() { return imagen; }

    public void setImagen(String imagen) { this.imagen = imagen; }

    public boolean isDestacado() { return destacado; }

    public void setDestacado(boolean destacado) { this.destacado = destacado; }

    public TipoDestino getTipo() { return tipo; }

    public void setTipo(TipoDestino tipo) { this.tipo = tipo; }
}
