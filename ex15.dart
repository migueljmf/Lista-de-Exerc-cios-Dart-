import 'dart:io';

void main() {
  stdout.write('Quantos bois deseja cadastrar? ');
  final quantidade = int.parse(stdin.readLineSync() ?? '0');

  final bois = <Map<String, dynamic>>[];

  for (int i = 1; i <= quantidade; i++) {
    stdout.writeln('');
    stdout.writeln('Boi $i');

    stdout.write('Numero do boi: ');
    final numero = stdin.readLineSync() ?? '';

    stdout.write('Peso do boi: ');
    final peso = double.parse(stdin.readLineSync() ?? '0');

    bois.add({
      'numero': numero,
      'peso': peso,
    });
  }

  while (true) {
    stdout.writeln('');
    stdout.write('Peso minimo para pesquisa: ');
    final minimo = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Peso maximo para pesquisa: ');
    final maximo = double.parse(stdin.readLineSync() ?? '0');

    bool encontrou = false;

    stdout.writeln('Bois encontrados no intervalo:');

    for (final boi in bois) {
      final peso = boi['peso'] as double;

      if (peso >= minimo && peso <= maximo) {
        encontrou = true;
        stdout.writeln('Numero: ${boi['numero']} | Peso: ${peso.toStringAsFixed(2)}');
      }
    }

    if (!encontrou) {
      stdout.writeln('Nenhum boi encontrado nesse intervalo.');
    }

    stdout.write('Deseja fazer outra pesquisa? (S/N): ');
    final continuar = (stdin.readLineSync() ?? '').toUpperCase();

    if (continuar != 'S') {
      break;
    }
  }
}
