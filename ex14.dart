import 'dart:io';

void main() {
  stdout.write('Tamanho do primeiro vetor: ');
  final tamanho1 = int.parse(stdin.readLineSync() ?? '0');

  final vetor1 = <int>[];
  for (int i = 1; i <= tamanho1; i++) {
    stdout.write('Vetor 1 - elemento $i: ');
    vetor1.add(int.parse(stdin.readLineSync() ?? '0'));
  }

  stdout.write('Tamanho do segundo vetor: ');
  final tamanho2 = int.parse(stdin.readLineSync() ?? '0');

  final vetor2 = <int>[];
  for (int i = 1; i <= tamanho2; i++) {
    stdout.write('Vetor 2 - elemento $i: ');
    vetor2.add(int.parse(stdin.readLineSync() ?? '0'));
  }

  final vetor3 = <int>[];
  int i = 0;
  int j = 0;

  while (i < vetor1.length && j < vetor2.length) {
    if (vetor1[i] <= vetor2[j]) {
      vetor3.add(vetor1[i]);
      i++;
    } else {
      vetor3.add(vetor2[j]);
      j++;
    }
  }

  while (i < vetor1.length) {
    vetor3.add(vetor1[i]);
    i++;
  }

  while (j < vetor2.length) {
    vetor3.add(vetor2[j]);
    j++;
  }

  stdout.writeln('Terceiro vetor ordenado: $vetor3');
}
