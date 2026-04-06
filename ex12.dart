import 'dart:io';

void main() {
  stdout.write('Digite um numero: ');
  final numero = stdin.readLineSync() ?? '';

  final invertido = numero.split('').reversed.join();

  stdout.writeln('Numero invertido: $invertido');
}
