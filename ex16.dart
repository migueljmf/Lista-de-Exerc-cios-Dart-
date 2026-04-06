import 'dart:io';

void main() {
  final vetores = <List<int>>[];

  for (int indice = 1; indice <= 4; indice++) {
    stdout.write('Tamanho do vetor $indice: ');
    final tamanho = int.parse(stdin.readLineSync() ?? '0');

    final vetor = <int>[];

    for (int i = 1; i <= tamanho; i++) {
      stdout.write('Vetor $indice - elemento $i: ');
      vetor.add(int.parse(stdin.readLineSync() ?? '0'));
    }

    vetores.add(vetor);
    stdout.writeln('');
  }

  final quintoVetor = <int>[];

  for (final vetor in vetores) {
    quintoVetor.addAll(vetor);
  }

  quintoVetor.sort();

  Set<int> intersecao = vetores[0].toSet();

  for (int i = 1; i < vetores.length; i++) {
    intersecao = intersecao.intersection(vetores[i].toSet());
  }

  final vetorIntersecao = intersecao.toList()..sort();

  stdout.writeln('Quinto vetor ordenado: $quintoVetor');
  stdout.writeln('Intersecao dos 4 vetores: $vetorIntersecao');
}
