import 'dart:io';

void main() {
  stdout.write('Tamanho dos vetores: ');
  final tamanho = int.parse(stdin.readLineSync() ?? '0');

  final vetor1 = <int>[];
  final vetor2 = <int>[];

  for (int i = 1; i <= tamanho; i++) {
    stdout.write('Vetor 1 - elemento $i: ');
    vetor1.add(int.parse(stdin.readLineSync() ?? '0'));
  }

  for (int i = 1; i <= tamanho; i++) {
    stdout.write('Vetor 2 - elemento $i: ');
    vetor2.add(int.parse(stdin.readLineSync() ?? '0'));
  }

  final vetor3 = somarVetores(vetor1, vetor2);
  final somaTotal = somarElementos(vetor3);

  stdout.writeln('Terceiro vetor: $vetor3');
  stdout.writeln('Soma de todos os elementos do terceiro vetor: $somaTotal');
}

List<int> somarVetores(List<int> vetor1, List<int> vetor2) {
  final resultado = <int>[];

  for (int i = 0; i < vetor1.length; i++) {
    resultado.add(vetor1[i] + vetor2[i]);
  }

  return resultado;
}

int somarElementos(List<int> vetor) {
  int soma = 0;

  for (final numero in vetor) {
    soma += numero;
  }

  return soma;
}
