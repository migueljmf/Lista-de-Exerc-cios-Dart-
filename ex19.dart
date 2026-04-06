import 'dart:io';

void main() {
  final tabuleiro = List.generate(3, (_) => List.filled(3, ' '));
  String jogadorAtual = 'X';
  int jogadas = 0;

  while (true) {
    mostrarTabuleiro(tabuleiro);
    stdout.writeln('Vez do jogador $jogadorAtual');

    stdout.write('Linha (1 a 3): ');
    final linha = int.parse(stdin.readLineSync() ?? '0') - 1;

    stdout.write('Coluna (1 a 3): ');
    final coluna = int.parse(stdin.readLineSync() ?? '0') - 1;

    if (linha < 0 || linha > 2 || coluna < 0 || coluna > 2) {
      stdout.writeln('Posicao invalida.');
      stdout.writeln('');
      continue;
    }

    if (tabuleiro[linha][coluna] != ' ') {
      stdout.writeln('Essa posicao ja esta ocupada.');
      stdout.writeln('');
      continue;
    }

    tabuleiro[linha][coluna] = jogadorAtual;
    jogadas++;

    if (venceu(tabuleiro, jogadorAtual)) {
      mostrarTabuleiro(tabuleiro);
      stdout.writeln('Jogador $jogadorAtual venceu!');
      break;
    }

    if (jogadas == 9) {
      mostrarTabuleiro(tabuleiro);
      stdout.writeln('Empate!');
      break;
    }

    jogadorAtual = jogadorAtual == 'X' ? 'O' : 'X';
    stdout.writeln('');
  }
}

void mostrarTabuleiro(List<List<String>> tabuleiro) {
  stdout.writeln('');

  for (int i = 0; i < 3; i++) {
    stdout.writeln(' ${tabuleiro[i][0]} | ${tabuleiro[i][1]} | ${tabuleiro[i][2]} ');

    if (i < 2) {
      stdout.writeln('-----------');
    }
  }

  stdout.writeln('');
}

bool venceu(List<List<String>> tabuleiro, String jogador) {
  for (int i = 0; i < 3; i++) {
    if (tabuleiro[i][0] == jogador &&
        tabuleiro[i][1] == jogador &&
        tabuleiro[i][2] == jogador) {
      return true;
    }

    if (tabuleiro[0][i] == jogador &&
        tabuleiro[1][i] == jogador &&
        tabuleiro[2][i] == jogador) {
      return true;
    }
  }

  if (tabuleiro[0][0] == jogador &&
      tabuleiro[1][1] == jogador &&
      tabuleiro[2][2] == jogador) {
    return true;
  }

  if (tabuleiro[0][2] == jogador &&
      tabuleiro[1][1] == jogador &&
      tabuleiro[2][0] == jogador) {
    return true;
  }

  return false;
}
