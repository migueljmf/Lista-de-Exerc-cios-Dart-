import 'dart:io';

void main() {
  int totalHomens = 0;
  int totalMulheres = 0;

  int somaIdadeHomensComExperiencia = 0;
  int homensComExperiencia = 0;

  int homensMais45 = 0;
  int mulheresMenos30ComExperiencia = 0;

  String nomeMulherMaisNovaComExperiencia = '';
  int menorIdadeMulherComExperiencia = 999999;

  while (true) {
    stdout.write('Nome (FIM para encerrar): ');
    final nome = stdin.readLineSync() ?? '';

    if (nome.toUpperCase() == 'FIM') {
      break;
    }

    stdout.write('Sexo (M/F): ');
    final sexo = (stdin.readLineSync() ?? '').toUpperCase();

    stdout.write('Idade: ');
    final idade = int.parse(stdin.readLineSync() ?? '0');

    stdout.write('Tem experiencia? (S/N): ');
    final experiencia = (stdin.readLineSync() ?? '').toUpperCase();

    if (sexo == 'M') {
      totalHomens++;

      if (experiencia == 'S') {
        somaIdadeHomensComExperiencia += idade;
        homensComExperiencia++;
      }

      if (idade > 45) {
        homensMais45++;
      }
    } else if (sexo == 'F') {
      totalMulheres++;

      if (idade < 30 && experiencia == 'S') {
        mulheresMenos30ComExperiencia++;
      }

      if (experiencia == 'S' && idade < menorIdadeMulherComExperiencia) {
        menorIdadeMulherComExperiencia = idade;
        nomeMulherMaisNovaComExperiencia = nome;
      }
    }

    stdout.writeln('');
  }

  stdout.writeln('Quantidade de candidatos do sexo masculino: $totalHomens');
  stdout.writeln('Quantidade de candidatos do sexo feminino: $totalMulheres');

  if (homensComExperiencia == 0) {
    stdout.writeln('Nao houve homens com experiencia.');
  } else {
    final media = somaIdadeHomensComExperiencia / homensComExperiencia;
    stdout.writeln('Idade media dos homens com experiencia: ${media.toStringAsFixed(2)}');
  }

  if (totalHomens == 0) {
    stdout.writeln('Nao houve homens para calcular o percentual acima de 45 anos.');
  } else {
    final percentual = (homensMais45 / totalHomens) * 100;
    stdout.writeln('Percentual de homens com mais de 45 anos: ${percentual.toStringAsFixed(2)}%');
  }

  stdout.writeln('Mulheres com menos de 30 anos e experiencia: $mulheresMenos30ComExperiencia');

  if (nomeMulherMaisNovaComExperiencia.isEmpty) {
    stdout.writeln('Nao houve mulher com experiencia.');
  } else {
    stdout.writeln('Mulher com experiencia e menor idade: $nomeMulherMaisNovaComExperiencia');
  }
}
