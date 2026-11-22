import 'package:flutter/material.dart';
import 'package:mi_catalogo/screens/menu_screen_ponchao.dart';
import '../widgets/custom_vertical_lines.dart';
import '../widgets/promo_card.dart';
// Removed invalid import 'menu_screen.dart'. Use menu_screen_ponchao.dart instead.

class PromocionesScreen extends StatelessWidget {
  const PromocionesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5D6C6),
      body: Stack(
        children: [
          const CustomVerticalLines(),
          SafeArea(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  // ENCABEZADO NEGRO CON LOGO Y IMAGEN DE TÍTULO
                  Container(
                    color: const Color(0xFF120E0B),
                    padding: const EdgeInsets.symmetric(
                      vertical: 3,
                      horizontal: 3,
                    ),
                    child: Row(
                      children: [
                        SizedBox(
                          width: 150,
                          height: 150,
                          child: Image.asset(
                            'assets/images/burro.png',
                            fit: BoxFit.contain,
                            errorBuilder: (context, error, stackTrace) {
                              return const Icon(
                                Icons.sports_baseball,
                                color: Colors.white,
                                size: 40,
                              );
                            },
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 20),
                            child: Image.asset(
                              'assets/images/logo.png',
                              fit: BoxFit.contain,
                              height: 75,
                              errorBuilder: (context, error, stackTrace) {
                                return const Icon(
                                  Icons.star,
                                  color: Colors.white,
                                  size: 20,
                                );
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 24),

                  // CONTENEDOR DE TARJETAS, INFORMACIÓN Y BOTÓN DEL MENÚ
                  Container(
                    height: 380,
                    margin: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 8,
                    ),
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFA08271).withOpacity(0.8),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          // 1. Promociones existentes
                          const PromoCard(
                            dia: 'LUNES',
                            promo: '2x1',
                            subtitulo: 'SABOR DOBLE, PRECIO ÚNICO',
                            imagePath: 'assets/images/burro2.png',
                          ),
                          const PromoCard(
                            dia: 'JUEVES',
                            promo: 'Promo 3x2\nburros',
                            subtitulo: '',
                            imagePath: 'assets/images/burro3.png',
                            isSpecialText: true,
                          ),
                          const PromoCard(
                            dia: 'DOMINGO',
                            promo: '2x1',
                            subtitulo: 'SABOR DOBLE, PRECIO ÚNICO',
                            imagePath: 'assets/images/burro5.png',
                          ),

                          // 2. Cuadro informativo de Ponchao'
                          Container(
                            width: 280,
                            margin: const EdgeInsets.only(left: 16),
                            padding: const EdgeInsets.all(24),
                            decoration: BoxDecoration(
                              color: const Color(0xFF120E0B).withOpacity(0.25),
                              borderRadius: BorderRadius.circular(24),
                              border: Border.all(
                                color: const Color(0xFF5D4037).withOpacity(0.6),
                                width: 2,
                              ),
                            ),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 130,
                                  width: 130,
                                  child: Image.asset(
                                    'assets/images/nosotros.png',
                                    fit: BoxFit.contain,
                                    errorBuilder: (context, error, stackTrace) {
                                      return const Icon(
                                        Icons.sports_baseball,
                                        color: Color(0xFFFF6D00),
                                        size: 52,
                                      );
                                    },
                                  ),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  "Ponchao' de Hambre",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 22,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                  ),
                                ),
                                const SizedBox(height: 12),
                                const Text(
                                  "Una aplicación web dedicada a los mejores burros percherones, combinando un gran sazón con toda la pasión y temática del béisbol.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    height: 1.5,
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ],
                            ),
                          ),

                          // 3. Botón del menú completo (Navegación Corregida)
                          Container(
                            width: 240,
                            margin: const EdgeInsets.only(left: 16, right: 8),
                            child: InkWell(
                              onTap: () {
                                Navigator.of(context).push(
                                  MaterialPageRoute(
                                    builder: (context) => InicioScreen(tipoCategoria: 'todos'),
                                  ),
                                );
                              },
                              borderRadius: BorderRadius.circular(24),
                              child: Ink(
                                decoration: BoxDecoration(
                                  color: const Color(0xFFFF6D00),
                                  borderRadius: BorderRadius.circular(24),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 8,
                                      offset: const Offset(0, 4),
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(20),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.all(8),
                                        height: 100,
                                        width: 100,
                                        decoration: const BoxDecoration(
                                          color: Color(0xFF120E0B),
                                          shape: BoxShape.circle,
                                        ),
                                        child: Image.asset(
                                          'assets/images/alucines.png',
                                          fit: BoxFit.contain,
                                          errorBuilder:
                                              (context, error, stackTrace) {
                                                return const Icon(
                                                  Icons.restaurant_menu,
                                                  color: Colors.white,
                                                  size: 36,
                                                );
                                              },
                                        ),
                                      ),
                                      const SizedBox(height: 24),
                                      const Text(
                                        "VER MENÚ\nCOMPLETO",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Color(0xFF120E0B),
                                          fontSize: 22,
                                          fontWeight: FontWeight.w900,
                                          letterSpacing: 1.5,
                                          height: 1.2,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Container(
                                        padding: const EdgeInsets.symmetric(
                                          horizontal: 12,
                                          vertical: 6,
                                        ),
                                        decoration: BoxDecoration(
                                          color: Colors.white.withOpacity(0.3),
                                          borderRadius: BorderRadius.circular(
                                            12,
                                          ),
                                        ),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.min,
                                          children: const [
                                            Text(
                                              "¡Pide ya!",
                                              style: TextStyle(
                                                color: Color(0xFF120E0B),
                                                fontWeight: FontWeight.bold,
                                                fontSize: 13,
                                              ),
                                            ),
                                            SizedBox(width: 4),
                                            Icon(
                                              Icons.arrow_forward_ios,
                                              size: 12,
                                              color: Color(0xFF120E0B),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
