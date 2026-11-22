import 'package:flutter/material.dart';

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
    // Definimos un ancho fijo en pixeles para que mantengan la proporción de "tarjeta vertical"
    // sin importar si el celular está en vertical u horizontal.
    const double cardWidth = 220.0;

    return Container(
      width: cardWidth,
      // Le agregamos un margen a la derecha para separarlas entre sí automáticamente
      margin: const EdgeInsets.only(right: 16),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFF5D4037),
        borderRadius: BorderRadius.circular(24),
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
          Text(
            dia,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            promo,
            textAlign: TextAlign.center,
            style: TextStyle(
              color: const Color(0xFFFF6D00),
              fontSize: isSpecialText ? 20 : 28,
              fontWeight: FontWeight.bold,
              shadows: const [
                Shadow(
                  color: Colors.black,
                  blurRadius: 2,
                  offset: Offset(1, 1),
                ),
              ],
            ),
          ),

          // Reducimos un poco el padding de la imagen para que no empuje el texto hacia afuera
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Image.asset(
                imagePath,
                fit: BoxFit.contain,
                errorBuilder: (context, error, stackTrace) {
                  return const Icon(
                    Icons.fastfood,
                    size: 60,
                    color: Colors.orange,
                  );
                },
              ),
            ),
          ),

          Text(
            subtitulo,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white70,
              fontSize: 10,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
