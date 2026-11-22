import 'package:flutter/material.dart';
import 'screens/promociones_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Percherones Ponchao App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: const Color(0xFFD32F2F),
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFFD32F2F)),
      ),
      home: const PromocionesScreen(),
    );
  }
}
