class Platillo {
  final String nombre;
  final String descripcion;
  final double precio;
  final String categoria; // Tacos, Bebidas, Promociones, etc.
  final String imagen;

  const Platillo({
    required this.nombre,
    required this.descripcion,
    required this.precio,
    required this.categoria,
    required this.imagen,
  });
}
