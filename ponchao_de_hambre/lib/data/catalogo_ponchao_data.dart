import '../models/platillo.dart';

String tipoCategoria = 'Percherones Ponchao';

List<Platillo> catalogo = [
  Platillo(
    nombre: 'El Espino',
    descripcion:
        'Deliciosa carne de asada al carbón en tortilla de Harina hecha a mano, con verdura y salsa al gusto.',
    precio: 125.00,
    categoria: 'percherones',
    imagen: 'assets/images/burro1.png',
  ),
  Platillo(
    nombre: 'El Hitazo',
    descripcion:
        'Carne de cerdo adobada lentamente en el trompo tradicional, acompañada de piña, cilantro y cebolla.',
    precio: 135.00,
    categoria: 'percherones',
    imagen: 'assets/images/burro4.png',
  ),
  Platillo(
    nombre: 'El Picher',
    descripcion:
        'Tortilla de Harina tostada al carbón con queso fundido y una generosa porción de Carne Mixta.',
    precio: 140.00,
    categoria: 'Especialidades',
    imagen: 'assets/images/burro3.png',
  ),
  Platillo(
    nombre: 'El Relevo',
    descripcion:
        'Carne de pollo a la parrilla, acompañada de vegetales y salsa al gusto.',
    precio: 130.00,
    categoria: 'percherones',
    imagen: 'assets/images/burro2.png',
  ),
];
