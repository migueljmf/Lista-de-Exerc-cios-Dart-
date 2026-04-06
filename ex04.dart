import 'dart:io';

void main() {
  int totalAlunos = 0;
  double somaMedias = 0;
  int aprovados = 0;

  String melhorMatriculaMasculina = '';
  double melhorMediaMasculina = -1;

  String melhorMatriculaFeminina = '';
  double melhorMediaFeminina = -1;

  double somaMediaFeminina = 0;
  int totalFeminino = 0;

  while (true) {
    stdout.write('Matricula (00000 para encerrar): ');
    final matricula = stdin.readLineSync() ?? '';

    if (matricula == '00000') {
      break;
    }

    stdout.write('Nome: ');
    final nome = stdin.readLineSync() ?? '';

    stdout.write('Sexo (M/F): ');
    final sexo = (stdin.readLineSync() ?? '').toUpperCase();

    stdout.write('Nota 1: ');
    final nota1 = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Nota 2: ');
    final nota2 = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Nota 3: ');
    final nota3 = double.parse(stdin.readLineSync() ?? '0');

    stdout.write('Numero de faltas: ');
    final faltas = int.parse(stdin.readLineSync() ?? '0');

    final media = (nota1 + nota2 + nota3) / 3;
    final aprovado = media >= 7 && faltas <= 18;

    totalAlunos++;
    somaMedias += media;

    if (aprovado) {
      aprovados++;
    }

    if (sexo == 'F') {
      totalFeminino++;
      somaMediaFeminina += media;
    }

    if (aprovado && sexo == 'M' && media > melhorMediaMasculina) {
      melhorMediaMasculina = media;
      melhorMatriculaMasculina = matricula;
    }

    if (aprovado && sexo == 'F' && media > melhorMediaFeminina) {
      melhorMediaFeminina = media;
      melhorMatriculaFeminina = matricula;
    }

    stdout.writeln('Aluno $nome cadastrado com media ${media.toStringAsFixed(2)}');
    stdout.writeln('');
  }

  if (totalAlunos == 0) {
    stdout.writeln('Nenhum aluno foi informado.');
    return;
  }

  final mediaTurma = somaMedias / totalAlunos;
  final percentualAprovados = (aprovados / totalAlunos) * 100;
  final mediaFeminina = totalFeminino > 0 ? somaMediaFeminina / totalFeminino : 0.0;

  stdout.writeln('Media da turma: ${mediaTurma.toStringAsFixed(2)}');
  stdout.writeln('Percentual de aprovados: ${percentualAprovados.toStringAsFixed(2)}%');

  if (melhorMatriculaMasculina.isEmpty) {
    stdout.writeln('Nao houve aluno masculino aprovado.');
  } else {
    stdout.writeln('Matricula do homem aprovado com maior media: $melhorMatriculaMasculina');
  }

  if (melhorMatriculaFeminina.isEmpty) {
    stdout.writeln('Nao houve aluna aprovada.');
  } else {
    stdout.writeln('Matricula da mulher aprovada com maior media: $melhorMatriculaFeminina');
  }

  stdout.writeln('Media das alunas: ${mediaFeminina.toStringAsFixed(2)}');
}
