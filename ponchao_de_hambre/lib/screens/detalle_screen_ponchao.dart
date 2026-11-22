import 'package:flutter/material.dart';
import '../models/platillo.dart';
import 'resena_screen_ponchao.dart';

class DetalleScreen extends StatelessWidget {
  final Platillo platillo;
  const DetalleScreen({super.key, required this.platillo});

  @override
  Widget build(BuildContext context) {
    // Paleta de colores oficial de Ponchao' de Hambre
    final Color colorHomeRun = const Color(0xFFFF6D00); // Naranja vibrante
    final Color colorPizarra = const Color(0xFF120E0B); // Negro rústico
    final Color colorEstadio = const Color(0xFFF5D6C6); // Fondo crema cálido

    return Scaffold(
      backgroundColor: colorEstadio,
      appBar: AppBar(
        title: Text(
          platillo.nombre.toUpperCase(),
          style: const TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.0,
            fontSize: 18,
          ),
        ),
        backgroundColor: colorPizarra,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Center(
          child: Container(
            // Restringimos el ancho máximo para que en web/tablets no se desarme el diseño
            constraints: const BoxConstraints(maxWidth: 600),
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // ── CONTENEDOR SEGURO PARA LA IMAGEN ──
                Container(
                  width: double.infinity,
                  height: 260,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(16),
                    border: Border.all(
                      color: colorPizarra.withOpacity(0.15),
                      width: 2,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: colorPizarra.withOpacity(0.1),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(14),
                    child: Padding(
                      padding: const EdgeInsets.all(
                        8.0,
                      ), // Un pequeño padding para que los burros PNG no toquen el borde blanco
                      child: Image.asset(
                        platillo.imagen,
                        fit: BoxFit
                            .contain, // Cambiado a contain para respetar las dimensiones y transparencias del asset
                        errorBuilder: (context, error, stackTrace) {
                          return Center(
                            child: Icon(
                              Icons.restaurant,
                              color: colorHomeRun,
                              size: 50,
                            ),
                          );
                        },
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),

                // ── DETALLES DEL PLATILLO ──
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Text(
                        platillo.nombre,
                        style: TextStyle(
                          fontSize: 26,
                          fontWeight: FontWeight.w900,
                          color: colorPizarra,
                          letterSpacing: 0.5,
                        ),
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      '\$${platillo.precio.toStringAsFixed(2)}',
                      style: TextStyle(
                        fontSize: 24,
                        fontWeight: FontWeight.w900,
                        color: colorHomeRun,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 12),

                // Categoría estilo etiqueta de Roster
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 4,
                  ),
                  decoration: BoxDecoration(
                    color: colorHomeRun.withOpacity(0.15),
                    borderRadius: BorderRadius.circular(6),
                    border: Border.all(
                      color: colorHomeRun.withOpacity(0.3),
                      width: 1,
                    ),
                  ),
                  child: Text(
                    platillo.categoria.toUpperCase(),
                    style: TextStyle(
                      color: colorHomeRun,
                      fontSize: 11,
                      fontWeight: FontWeight.w900,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
                const SizedBox(height: 8),

                // Divisor de pizarra rústica
                Divider(color: colorPizarra.withOpacity(0.15), thickness: 2),
                const SizedBox(height: 12),

                // Sección de Descripción
                Text(
                  'ANOTACIONES DEL CHEF / INGREDIENTES',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.w800,
                    color: colorPizarra.withOpacity(0.6),
                    letterSpacing: 1.5,
                  ),
                ),
                const SizedBox(height: 8),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: colorPizarra.withOpacity(0.1),
                      width: 1.5,
                    ),
                  ),
                  child: Text(
                    platillo.descripcion,
                    style: TextStyle(
                      fontSize: 16,
                      color: colorPizarra.withOpacity(0.85),
                      height: 1.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                const SizedBox(height: 35),

                // ── BOTÓN DE ENTRADA AL BUZÓN (ESTILO HOME RUN) ──
                SizedBox(
                  width: double.infinity,
                  height: 52,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: colorPizarra,
                      foregroundColor: Colors.white,
                      elevation: 4,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                        side: BorderSide(color: colorHomeRun, width: 2),
                      ),
                    ),
                    onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ResenaScreen(platillo: platillo),
                      ),
                    ),
                    label: Text(
                      'DEJAR UNA SUGERENCIA',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w900,
                        color: colorHomeRun,
                        letterSpacing: 1.2,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
