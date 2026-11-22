import 'package:flutter/material.dart';
import '../data/catalogo_ponchao_data.dart';
import 'detalle_screen_ponchao.dart';

class InicioScreen extends StatelessWidget {
  final String tipoCategoria;

  const InicioScreen({super.key, required this.tipoCategoria});

  @override
  Widget build(BuildContext context) {
    // Paleta de colores de Ponchao' de Hambre
    final Color colorHomeRun = const Color(0xFFFF6D00);
    final Color colorPizarra = const Color(0xFF120E0B);
    final Color colorEstadio = const Color(0xFFF5D6C6);

    // Filtrar catálogo por categoría
    final platillosFiltrados = catalogo
        .where((p) => p.categoria.toLowerCase() == tipoCategoria.toLowerCase())
        .toList();

    final listaAExhibir = platillosFiltrados.isEmpty
        ? catalogo
        : platillosFiltrados;

    return Scaffold(
      backgroundColor: colorEstadio,
      body: Stack(
        children: [
          // CUERPO DE LA PANTALLA CON SCROLL INTEGRADO
          CustomScrollView(
            physics: const BouncingScrollPhysics(),
            slivers: [
              SliverToBoxAdapter(
                child: Container(
                  height: 80.0,
                  width: double.infinity,
                  color: colorPizarra, // Color de fondo mientras carga el asset
                  child: Image.asset(
                    'assets/images/menu.png', // <--- Pon aquí la ruta de tu imagen
                    // BoxFit.cover: Llena el espacio recortando los bordes excedentes sin deformar.
                    // BoxFit.fill: Fuerza a la imagen a estirarse exactamente al alto y ancho del contenedor.
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              SliverPadding(
                padding: const EdgeInsets.symmetric(
                  vertical: 16,
                  horizontal: 16,
                ),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate((context, index) {
                    final platillo = listaAExhibir[index];

                    return Container(
                      margin: const EdgeInsets.only(bottom: 14),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(
                          color: colorPizarra.withOpacity(0.15),
                          width: 2,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: colorPizarra.withOpacity(0.08),
                            blurRadius: 6,
                            offset: const Offset(0, 4),
                          ),
                        ],
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(14),
                        child: InkWell(
                          onTap: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetalleScreen(platillo: platillo),
                            ),
                          ),
                          child: Row(
                            children: [
                              // IMAGEN DEL BURRO PERCHERÓN / PROMO
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  border: Border(
                                    right: BorderSide(
                                      color: colorHomeRun,
                                      width: 3,
                                    ),
                                  ),
                                ),
                                child: Image.asset(
                                  platillo.imagen,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color: colorPizarra,
                                      child: Icon(
                                        Icons.restaurant,
                                        color: colorHomeRun,
                                        size: 32,
                                      ),
                                    );
                                  },
                                ),
                              ),

                              // DETALLES DEL PLATILLO
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      // Etiqueta de Categoría (Estilo Roster)
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 8,
                                          vertical: 2,
                                        ),
                                        decoration: BoxDecoration(
                                          color: colorHomeRun.withOpacity(0.15),
                                          borderRadius: BorderRadius.circular(
                                            6,
                                          ),
                                        ),
                                        child: Text(
                                          platillo.categoria.toUpperCase(),
                                          style: TextStyle(
                                            color: colorHomeRun,
                                            fontSize: 10,
                                            fontWeight: FontWeight.w900,
                                            letterSpacing: 1,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 6),
                                      // Nombre
                                      Text(
                                        platillo.nombre,
                                        maxLines: 1,
                                        overflow: TextOverflow.ellipsis,
                                        style: TextStyle(
                                          color: colorPizarra,
                                          fontWeight: FontWeight.w900,
                                          fontSize: 18,
                                          letterSpacing: 0.5,
                                        ),
                                      ),
                                      const SizedBox(height: 4),
                                      // Precio
                                      Text(
                                        '\$${platillo.precio.toStringAsFixed(2)}',
                                        style: TextStyle(
                                          color: colorHomeRun,
                                          fontWeight: FontWeight.w800,
                                          fontSize: 16,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              // BOTÓN DE ACCIÓN CON FLECHA MINI
                              Container(
                                height: 100,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 12,
                                ),
                                color: colorPizarra.withOpacity(0.03),
                                child: Center(
                                  child: Container(
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      color: colorPizarra,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.arrow_forward_ios,
                                      color: Colors.white,
                                      size: 14,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }, childCount: listaAExhibir.length),
                ),
              ),
            ],
          ),

          // =========================================================
          // 3. BOTÓN FLOTANTE PARA REGRESAR
          // =========================================================
          Positioned(
            top: MediaQuery.of(context).padding.top + 12,
            left: 16,
            child: CircleAvatar(
              backgroundColor: colorPizarra.withOpacity(0.7),
              radius: 20,
              child: IconButton(
                icon: const Icon(
                  Icons.arrow_back,
                  color: Colors.white,
                  size: 20,
                ),
                onPressed: () => Navigator.pop(context),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
