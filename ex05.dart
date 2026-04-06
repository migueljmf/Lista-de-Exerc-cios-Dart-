import 'dart:io';

void main() {
  stdout.write('Quantos recem-nascidos deseja cadastrar? ');
  final quantidade = int.parse(stdin.readLineSync() ?? '0');

  int baixoPeso = 0;
  int normal = 0;
  int altoPeso = 0;

  String nomeMaiorPesoFeminino = '';
  double maiorPesoFeminino = -1;

  for (int i = 1; i <= quantidade; i++) {
    stdout.writeln('');
    stdout.writeln('Recem-nascido $i');

    stdout.write('Nome: ');
    final nome = stdin.readLineSync() ?? '';

    stdout.write('Sexo (M/F): ');
    final sexo = (stdin.readLineSync() ?? '').toUpperCase();

    stdout.write('Peso em kg: ');
    final peso = double.parse(stdin.readLineSync() ?? '0');

    String classificacao;

    if (peso <= 2) {
      classificacao = 'Baixo peso';
      baixoPeso++;
    } else if (peso <= 4) {
      classificacao = 'Normal';
      normal++;
    } else {
      classificacao = 'Alto peso';
      altoPeso++;
    }

    if (sexo == 'F' && peso > maiorPesoFeminino) {
      maiorPesoFeminino = peso;
      nomeMaiorPesoFeminino = nome;
    }

    stdout.writeln('Nome: $nome');
    stdout.writeln('Sexo: $sexo');
    stdout.writeln('Classificacao: $classificacao');
  }

  if (quantidade == 0) {
    stdout.writeln('Nenhum dado foi informado.');
    return;
  }

  stdout.writeln('');

  if (nomeMaiorPesoFeminino.isEmpty) {
    stdout.writeln('Nao houve recem-nascido do sexo feminino.');
  } else {
    stdout.writeln('Menina com maior peso: $nomeMaiorPesoFeminino');
  }

  stdout.writeln('Percentual de baixo peso: ${((baixoPeso / quantidade) * 100).toStringAsFixed(2)}%');
  stdout.writeln('Percentual de peso normal: ${((normal / quantidade) * 100).toStringAsFixed(2)}%');
  stdout.writeln('Percentual de alto peso: ${((altoPeso / quantidade) * 100).toStringAsFixed(2)}%');
}
