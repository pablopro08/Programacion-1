import 'package:flutter/material.dart';

class PromocionesTab extends StatelessWidget {
  const PromocionesTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // Fondo de color crema base de la imagen
      backgroundColor: const Color(0xFFF5D6C6),
      body: Stack(
        children: [
          // Capa de fondo: Líneas verticales simulando el patrón de la imagen
          const CustomVerticalLines(),

          // Contenido principal
          SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Encabezado Negro "PROMOCIONES"
                Container(
                  color: const Color(0xFF120E0B),
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: const Text(
                    'PROMOCIONES',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      letterSpacing: 4,
                    ),
                  ),
                ),

                const SizedBox(height: 24),

                // Contenedor principal de las tarjetas (Gris/Marrón claro translúcido)
                Expanded(
                  child: Container(
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Color(0xFFA08271).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        children: const [
                          PromoCard(
                            dia: 'LUNES',
                            promo: '2x1',
                            subtitulo: 'SABOR DOBLE, PRECIO ÚNICO',
                            imagePath:
                                'assets/images/burro1.png', // Reemplaza con tus assets
                          ),
                          SizedBox(width: 16),
                          PromoCard(
                            dia: 'JUEVES',
                            promo: 'Promo 3x2\nburros',
                            subtitulo: '',
                            imagePath: 'assets/images/burro1.png',
                            isSpecialText: true,
                          ),
                          SizedBox(width: 16),
                          PromoCard(
                            dia: 'DOMINGO',
                            promo: '2x1',
                            subtitulo: 'SABOR DOBLE, PRECIO ÚNICO',
                            imagePath: 'assets/burro_domingo.png',
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 16),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Widget personalizado para las tarjetas de cada promoción
class PromoCard extends StatelessWidget {
  final String dia;
  final String promo;
  final String subtitulo;
  final String imagePath;
  final bool isSpecialText;

  const PromoCard({
    Key? key,
    required this.dia,
    required this.promo,
    required this.subtitulo,
    required this.imagePath,
    this.isSpecialText = false,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Ancho fijo para mantener la proporción vertical de la imagen
    double cardWidth = MediaQuery.of(context).size.width * 0.65;

    return Container(
      width: cardWidth,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Color(0xFF5D4037), // Marrón oscuro de fondo de la tarjeta
        borderRadius: BorderRadius.circular(
          30,
        ), // Bordes redondeados pronunciados
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 6,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Día de la semana
          Text(
            dia,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 26,
              fontWeight: FontWeight.w900,
              letterSpacing: 1,
            ),
          ),

          // Tipo de promoción (2x1 o 3x2)
          Text(
            promo,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFFFF6D00), // Naranja llamativo
              fontSize: isSpecialText ? 24 : 36,
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                  color: Colors.black,
                  blurRadius: 2,
                  offset: Offset(2, 2),
                ),
              ],
            ),
          ),

          // Imagen del Burrito
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  // Placeholder por si aún no configuras los assets
                  return const Icon(
                    Icons.fastfood,
                    size: 80,
                    color: Colors.orange,
                  );
                },
              ),
            ),
          ),

          // Subtítulo inferior
          Text(
            subtitulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 11,
              fontWeight: FontWeight.w500,
              letterSpacing: 0.5,
            ),
          ),
        ],
      ),
    );
  }
}

// Dibujo personalizado para las líneas verticales del fondo
class CustomVerticalLines extends StatelessWidget {
  const CustomVerticalLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(15, (index) {
          return Container(
            width: 1,
            color: Colors.black.withOpacity(0.12), // Líneas sutiles
          );
        }),
      ),
    );
  }
}
