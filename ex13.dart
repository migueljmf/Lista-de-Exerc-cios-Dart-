import 'dart:io';

void main() {
  stdout.write('Digite a quantidade de numeros: ');
  final quantidade = int.parse(stdin.readLineSync() ?? '0');

  final numeros = <int>[];

  for (int i = 1; i <= quantidade; i++) {
    stdout.write('Digite o numero $i: ');
    numeros.add(int.parse(stdin.readLineSync() ?? '0'));
  }

  final frequencia = <int, int>{};
  final ordem = <int>[];

  for (final numero in numeros) {
    if (!frequencia.containsKey(numero)) {
      ordem.add(numero);
      frequencia[numero] = 0;
    }

    frequencia[numero] = frequencia[numero]! + 1;
  }

  stdout.writeln('');
  stdout.writeln('Resultado:');

  for (final numero in ordem) {
    stdout.writeln('$numero - ${frequencia[numero]}');
  }
}
