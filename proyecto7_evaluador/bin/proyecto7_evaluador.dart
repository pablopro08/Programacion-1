import 'dart:io';

// Función 1: Agregar una nueva calificación
void agregarCalificacion(List<double> lista) {
  print('\nIngresa la calificación (0-100): ');
  String? input = stdin.readLineSync();

  try {
    double calif = double.parse(input ?? '0'); // Convierte texto a número

    // Validar que esté en rango
    if (calif < 0 || calif > 100) {
      print(' La calificación debe estar entre 0 y 100');
      return;
    }

    // Agregar a la lista usando .add()
    lista.add(calif);

    print(' Calificación agregada: $calif');
    print(' Total en lista: ${lista.length} elementos');
  } catch (e) {
    print(' Error: debes ingresar un número válido');
  }
}

// Función 2: Eliminar una calificación específica
void eliminarCalificacion(List<double> lista) {
  // Verificar que la lista NO esté vacía
  if (lista.isEmpty) {
    print('\n No hay calificaciones para eliminar');
    return;
  }

  print('\nIngresa la calificación a eliminar: ');
  String? input = stdin.readLineSync();

  try {
    double calif = double.parse(input ?? '0');

    // Usar .remove() para eliminar
    bool fue_eliminada = lista.remove(calif);

    if (fue_eliminada) {
      print(' Calificación $calif eliminada correctamente');
    } else {
      print(' La calificación $calif no existe en la lista');
    }

    print(' Restantes: ${lista.length} elementos');
  } catch (e) {
    print(' Error: debes ingresar un número válido');
  }
}

// Función 3: Ver listado completo de calificaciones
void verListado(List<double> lista) {
  // Verificar que la lista NO esté vacía
  if (lista.isEmpty) {
    print('\n No hay calificaciones registradas');
    return;
  }

  print('\n' + '=' * 50);
  print('LISTADO DE CALIFICACIONES');
  print('=' * 50);

  // Iterar sobre la lista usando for tradicional para acceder al índice
  for (int i = 0; i < lista.length; i++) {
    print('${i + 1}. ${lista[i]}');
  }

  print('=' * 50);
  print('Total: ${lista.length} elementos');
}

// Función 4: Calcular el promedio del grupo
double calcularPromedio(List<double> lista) {
  // Validar que la lista NO esté vacía
  if (lista.isEmpty) {
    print('\n No hay calificaciones para calcular promedio');
    return 0;
  }

  double suma = 0;

  // Usar forEach para sumar todos los elementos
  lista.forEach((calif) {
    suma += calif;
  });

  // Calcular el promedio
  double promedio = suma / lista.length;

  print('\n' + '=' * 50);
  print('PROMEDIO DEL GRUPO');
  print('=' * 50);
  print('Suma total: ${suma.toStringAsFixed(2)}');
  print('Cantidad de calificaciones: ${lista.length}');
  print('Promedio: ${promedio.toStringAsFixed(2)}');
  print('=' * 50);
  return promedio;
}

// Función 5: Buscar una calificación específica
void buscarCalificacion(List<double> lista) {
  // Verificar que la lista NO esté vacía
  if (lista.isEmpty) {
    print('\n No hay calificaciones para buscar');
    return;
  }

  print('\nIngresa la calificación a buscar: ');
  String? input = stdin.readLineSync();

  try {
    double calif = double.parse(input ?? '0');

    // Usar .contains() para verificar si existe
    if (lista.contains(calif)) {
      // Usar .indexOf() para encontrar posición
      int posicion = lista.indexOf(calif);
      print(' Calificación encontrada en posición ${posicion + 1}');
    } else {
      print(' La calificación $calif no existe en la lista');
    }
  } catch (e) {
    print(' Error: debes ingresar un número válido');
  }
}

// Función 6: Mostrar estadísticas (máximo, mínimo, promedio)
void mostrarEstadisticas(List<double> lista) {
  // Verificar que la lista NO esté vacía
  if (lista.isEmpty) {
    print('\n No hay calificaciones para mostrar estadísticas');
    return;
  }

  // Inicializar máximo y mínimo con el primer elemento
  double maxima = lista[0];
  double minima = lista[0];

  // Iterar para encontrar máximo y mínimo
  for (double calif in lista) {
    if (calif > maxima) {
      maxima = calif;
    }
    if (calif < minima) {
      minima = calif;
    }
  }

  // Reutilizar función calcularPromedio()
  double promedio = calcularPromedio(lista);

  print('\n' + '=' * 50);
  print('ESTADÍSTICAS DEL GRUPO');
  print('=' * 50);
  print('Cantidad de calificaciones: ${lista.length}');
  print('Calificación máxima: ${maxima.toStringAsFixed(2)}');
  print('Calificación mínima: ${minima.toStringAsFixed(2)}');
  print('Promedio: ${promedio.toStringAsFixed(2)}');
  print('=' * 50);
}

void main() {
  bool continuar = true;
  List<double> calificaciones = []; // Asegúrate de declarar esta lista aquí

  while (continuar) {
    print('╔════════════════════════════════════════════╗');
    print('║       GESTOR DE CALIFICACIONES V 1.0       ║');
    print('╚════════════════════════════════════════════╝');
    print('1. Agregar calificación');
    print('2. Eliminar calificación');
    print('3. Ver listado de calificaciones');
    print('4. Calcular promedio del grupo');
    print('5. Buscar calificación');
    print('6. Ver estadísticas');
    print('7. Salir');
    print('\nElige una opción: ');

    String? opcion = stdin.readLineSync();

    switch (opcion) {
      case '1':
        agregarCalificacion(calificaciones);
        break;
      case '2':
        eliminarCalificacion(calificaciones);
        break;
      case '3':
        verListado(calificaciones);
        break;
      case '4':
        calcularPromedio(calificaciones);
        break;
      case '5':
        buscarCalificacion(calificaciones);
        break;
      case '6':
        mostrarEstadisticas(calificaciones);
        break;
      case '7':
        continuar = false;
        print('\n¡Gracias por usar el gestor de calificaciones!\n');
        break;
      default:
        print(' Opción no válida');
    }
  }
}
