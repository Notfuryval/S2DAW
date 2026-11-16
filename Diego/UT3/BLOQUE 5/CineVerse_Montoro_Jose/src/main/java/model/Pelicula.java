package model;



public class Pelicula {
    private int id;
    private String titulo;
    private String sinopsis;
    private int duracion;
    private int anio;
    private String clasificacion;
    private String imagen;
    private Genero genero;

    public Pelicula() {}

    public int getId() { return id; }

    public void setId(int id) { this.id = id; }

    public String getTitulo() { return titulo; }

    public void setTitulo(String titulo) { this.titulo = titulo; }

    public String getSinopsis() { return sinopsis; }

    public void setSinopsis(String sinopsis) { this.sinopsis = sinopsis; }

    public int getDuracion() { return duracion; }

    public void setDuracion(int duracion) { this.duracion = duracion; }

    public int getAnio() { return anio; }

    public void setAnio(int anio) { this.anio = anio; }

    public String getClasificacion() { return clasificacion; }

    public void setClasificacion(String clasificacion) { this.clasificacion = clasificacion; }

    public String getImagen() { return imagen; }

    public void setImagen(String imagen) { this.imagen = imagen; }

    public Genero getGenero() { return genero; }

    public void setGenero(Genero genero) { this.genero = genero; }
}
