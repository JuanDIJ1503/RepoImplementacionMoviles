//! CALCULADORA GENERAL
import 'dart:io';
import 'dart:math';

void main(List<String> args) {
  print("Ingrese operacion a realizar");
  print("1: Suma, 2: Resta, 3: Multiplicación, 4: División, 5: Potencia");
  String? operacion = stdin.readLineSync();
  switch (operacion) {
    case "1":
      suma();
      break;
    case "2":
      resta();
      break;
    case "3":
      String resultadoMulti = multi().toString();
      saveToFile(resultadoMulti);
      break;
    case "4":
      divi(a: 10, b: 2);
      break;
    case "5":
      potencia(ap: 2, bp: 3);
      break;
    default:
      print("Ingrese un valor correcto");
  }
}

void suma() {
  print('Ingrese el primer número:');
  int num1 = int.parse(stdin.readLineSync()!);

  print('Ingrese el segundo número:');
  int num2 = int.parse(stdin.readLineSync()!);

  int sum = num1 + num2;

  print('La suma es: $sum');
}

void resta() {
  print('Ingrese el primer número:');
  int num1 = int.parse(stdin.readLineSync()!);

  print('Ingrese el segundo número:');
  int num2 = int.parse(stdin.readLineSync()!);

  int resultado = num1 - num2;

  print('La resta es: $resultado');
}

double multi() {
  double num1;
  while (true) {
    print("Ingrese primer número");
    String? input = stdin.readLineSync();
    try {
      num1 = double.parse(input!);
      break;
    } catch (e) {
      print("El valor ingresado no es valido");
    }
  }
  ;

  double num2;
  while (true) {
    print("Ingrese segundo número");
    String? num2i = stdin.readLineSync();
    try {
      num2 = double.parse(num2i!);
      break;
    } catch (e) {
      print("El valor ingresado no es valido");
    }
  }

  List<double> extras = [];

  while (true) {
    print("¿Desea ingresar otro número? SI / NO");
    String? sig = stdin.readLineSync();

    if (sig == "SI") {
      while (true) {
        print("Ingrese el nuevo número");
        String? numExi = stdin.readLineSync();
        try {
          double numEx = double.parse(numExi!);
          extras.add(numEx);
          break;
        } catch (e) {
          print("El valor ingresado no es valido");
        }
      }
    } else if (sig == "NO") {
      break;
    } else {
      print("Ingrese SI o NO");
    }
  }

  double e = 1;

  for (var element in extras) {
    e *= element;
  }
  double resFinal = num1 * num2 * e;
  return resFinal;
}

void divi({required double a, double b = 1}) {
  if (b != 0) {
    double resultado = a / b;
    print("La división es: $resultado");
  } else {
    print("No se puede dividir entre cero");
  }
}

void potencia({required ap, int bp = 0}) {
  return print("El resultado es: ${pow(ap, bp)}");
}

void saveToFile(String content) {
  final File file = File('Historial_Multi.txt');
  file.writeAsString(content).then((value) {
    print('Resultado guardado en el archivo Historial_Multi.txt');
  }).catchError((error) {
    print('Ocurrió un error al guardar el archivo: $error');
  });
}
