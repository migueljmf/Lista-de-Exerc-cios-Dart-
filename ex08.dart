import 'dart:io';

void main() {
  final aprovadosCC = <Map<String, dynamic>>[];

  String nomeMenorPontuacaoMasculina = '';
  double menorPontuacaoMasculina = 999999;

  String codigoMaiorSiMasculino = '';
  double maiorPontuacaoSiMasculino = -1;

  int totalMasculino = 0;
  int totalFeminino = 0;
  int totalCandidatos = 0;

  while (true) {
    stdout.write('Codigo (0000 para encerrar): ');
    final codigo = stdin.readLineSync() ?? '';

    if (codigo == '0000') {
      break;
    }

    stdout.write('Curso (CC/SI): ');
    final curso = (stdin.readLineSync() ?? '').toUpperCase();

    stdout.write('Nome: ');
    final nome = stdin.readLineSync() ?? '';

    stdout.write('Sexo (M/F): ');
    final sexo = (stdin.readLineSync() ?? '').toUpperCase();

    stdout.write('Pontuacao: ');
    final pontuacao = double.parse(stdin.readLineSync() ?? '0');

    totalCandidatos++;

    if (sexo == 'M') {
      totalMasculino++;
    } else if (sexo == 'F') {
      totalFeminino++;
    }

    if (curso == 'CC' && pontuacao > 2500) {
      aprovadosCC.add({
        'codigo': codigo,
        'nome': nome,
        'pontuacao': pontuacao,
      });
    }

    if (sexo == 'M' && pontuacao < menorPontuacaoMasculina) {
      menorPontuacaoMasculina = pontuacao;
      nomeMenorPontuacaoMasculina = nome;
    }

    if (sexo == 'M' && curso == 'SI' && pontuacao > maiorPontuacaoSiMasculino) {
      maiorPontuacaoSiMasculino = pontuacao;
      codigoMaiorSiMasculino = codigo;
    }

    stdout.writeln('');
  }

  stdout.writeln('');
  stdout.writeln('Candidatos de CC com mais de 2500 pontos:');

  if (aprovadosCC.isEmpty) {
    stdout.writeln('Nenhum candidato encontrado.');
  } else {
    for (final candidato in aprovadosCC) {
      stdout.writeln(
        'Codigo: ${candidato['codigo']} | Nome: ${candidato['nome']} | Pontuacao: ${candidato['pontuacao']}',
      );
    }
  }

  if (nomeMenorPontuacaoMasculina.isEmpty) {
    stdout.writeln('Nao houve candidato masculino.');
  } else {
    stdout.writeln('Homem com menor pontuacao geral: $nomeMenorPontuacaoMasculina');
  }

  if (codigoMaiorSiMasculino.isEmpty) {
    stdout.writeln('Nao houve candidato masculino em SI.');
  } else {
    stdout.writeln('Codigo do homem com maior pontuacao em SI: $codigoMaiorSiMasculino');
  }

  if (totalCandidatos == 0) {
    stdout.writeln('Nenhum candidato foi cadastrado.');
    return;
  }

  stdout.writeln('Percentual masculino: ${((totalMasculino / totalCandidatos) * 100).toStringAsFixed(2)}%');
  stdout.writeln('Percentual feminino: ${((totalFeminino / totalCandidatos) * 100).toStringAsFixed(2)}%');
}
