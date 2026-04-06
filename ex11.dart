import 'dart:io';

void main() {
  final professores = <Map<String, dynamic>>[];

  double somaLiquidoMasculino = 0;
  int totalMasculino = 0;

  double somaLiquidoFeminino = 0;
  int totalFeminino = 0;

  while (true) {
    stdout.write('Codigo (9999 para encerrar): ');
    final codigo = stdin.readLineSync() ?? '';

    if (codigo == '9999') {
      break;
    }

    stdout.write('Nome: ');
    final nome = stdin.readLineSync() ?? '';

    stdout.write('Sexo (M/F): ');
    final sexo = (stdin.readLineSync() ?? '').toUpperCase();

    stdout.write('Horas de aula no mes: ');
    final horas = double.parse(stdin.readLineSync() ?? '0');

    final salarioBruto = horas * 12.30;
    final desconto = sexo == 'M' ? 0.10 : 0.05;
    final salarioLiquido = salarioBruto - (salarioBruto * desconto);

    professores.add({
      'codigo': codigo,
      'nome': nome,
      'bruto': salarioBruto,
      'liquido': salarioLiquido,
    });

    if (sexo == 'M') {
      totalMasculino++;
      somaLiquidoMasculino += salarioLiquido;
    } else if (sexo == 'F') {
      totalFeminino++;
      somaLiquidoFeminino += salarioLiquido;
    }

    stdout.writeln('');
  }

  stdout.writeln('');
  stdout.writeln('Listagem dos professores:');

  for (final professor in professores) {
    stdout.writeln(
      'Codigo: ${professor['codigo']} | Nome: ${professor['nome']} | Bruto: R\$${(professor['bruto'] as double).toStringAsFixed(2)} | Liquido: R\$${(professor['liquido'] as double).toStringAsFixed(2)}',
    );
  }

  if (totalMasculino == 0) {
    stdout.writeln('Nao houve professores do sexo masculino.');
  } else {
    final media = somaLiquidoMasculino / totalMasculino;
    stdout.writeln('Media dos salarios liquidos masculinos: R\$${media.toStringAsFixed(2)}');
  }

  if (totalFeminino == 0) {
    stdout.writeln('Nao houve professoras.');
  } else {
    final media = somaLiquidoFeminino / totalFeminino;
    stdout.writeln('Media dos salarios liquidos femininos: R\$${media.toStringAsFixed(2)}');
  }
}
