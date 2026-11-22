import 'package:flutter/material.dart';
import '../models/platillo.dart';

class ResenaScreen extends StatelessWidget {
  final Platillo platillo;
  const ResenaScreen({super.key, required this.platillo});

  @override
  Widget build(BuildContext context) {
    // Paleta de colores oficial "Ponchao' de Hambre"
    final Color colorHomeRun = const Color(0xFFFF6D00); // Naranja vibrante
    final Color colorPizarra = const Color(0xFF120E0B); // Negro rústico
    final Color colorEstadio = const Color(
      0xFFF5D6C6,
    ); // Crema/Fondo de estadio

    return Scaffold(
      backgroundColor: colorEstadio,
      appBar: AppBar(
        title: const Text(
          'BUZÓN DE SUGERENCIAS',
          style: TextStyle(
            fontWeight: FontWeight.w900,
            letterSpacing: 1.5,
            fontSize: 18,
          ),
        ),
        backgroundColor: colorPizarra,
        foregroundColor: Colors.white,
        centerTitle: true,
        elevation: 4,
        actions: [Padding(padding: const EdgeInsets.only(right: 16.0))],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // CONTENEDOR ESTILO PIZARRA CON LA PREGUNTA
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: colorPizarra,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: colorPizarra.withOpacity(0.15),
                      blurRadius: 6,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'REPORTE DE CALIDAD',
                      style: TextStyle(
                        color: colorHomeRun,
                        fontWeight: FontWeight.w900,
                        fontSize: 12,
                        letterSpacing: 2,
                      ),
                    ),
                    const SizedBox(height: 6),
                    Text(
                      '¿Qué tal estuvo tu ${platillo.nombre}?',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25),

              // CAMPO: NOMBRE DEL JUGADOR (USUARIO)
              Text(
                'NOMBRE DEL SCOUT / COMENSAL',
                style: TextStyle(
                  color: colorPizarra,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                cursorColor: colorHomeRun,
                style: TextStyle(
                  color: colorPizarra,
                  fontWeight: FontWeight.w600,
                ),
                decoration: InputDecoration(
                  hintText: 'Tu Nombre (Opcional)',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true,
                  fillColor: Colors.white,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorPizarra.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorHomeRun, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // CAMPO: COMENTARIOS Y CRÍTICAS
              Text(
                'ANOTACIONES O SUGERENCIAS',
                style: TextStyle(
                  color: colorPizarra,
                  fontWeight: FontWeight.w800,
                  fontSize: 12,
                  letterSpacing: 1,
                ),
              ),
              const SizedBox(height: 8),
              TextField(
                cursorColor: colorHomeRun,
                maxLines: 5,
                style: TextStyle(
                  color: colorPizarra,
                  fontWeight: FontWeight.w500,
                ),
                decoration: InputDecoration(
                  hintText:
                      'Déjanos tus comentarios sobre el sazón, tamaño o servicio...',
                  hintStyle: TextStyle(color: Colors.grey[500]),
                  filled: true,
                  fillColor: Colors.white,
                  alignLabelWithHint: true,
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(
                      color: colorPizarra.withOpacity(0.2),
                      width: 2,
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12),
                    borderSide: BorderSide(color: colorHomeRun, width: 2),
                  ),
                ),
              ),
              const SizedBox(height: 35),

              // BOTÓN DE ENVÍO ESTILO HOME RUN
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: colorPizarra,
                    foregroundColor: Colors.white,
                    elevation: 4,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                      side: BorderSide(
                        color: colorHomeRun,
                        width: 2,
                      ), // Borde naranja llamativo
                    ),
                  ),
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        backgroundColor: colorPizarra,
                        content: Row(
                          children: [
                            Icon(Icons.sports_baseball, color: colorHomeRun),
                            const SizedBox(width: 12),
                            const Expanded(
                              child: Text(
                                '¡Comentario enviado al dugout de Ponchao!',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                    Navigator.pop(context);
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'ENVIAR REPORTE',
                        style: TextStyle(
                          color: colorHomeRun,
                          fontWeight: FontWeight.w900,
                          letterSpacing: 1.5,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
