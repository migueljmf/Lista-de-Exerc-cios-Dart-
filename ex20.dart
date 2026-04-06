import 'dart:io';

void main() {
  List<List<String>> mapa = [
    ['#', '#', '#', '#', '#', '#', '#', '#'],
    ['#', 'P', ' ', ' ', '#', ' ', 'E', '#'],
    ['#', ' ', '#', ' ', '#', ' ', '#', '#'],
    ['#', ' ', '#', ' ', ' ', ' ', ' ', '#'],
    ['#', ' ', '#', '#', '#', '#', ' ', '#'],
    ['#', ' ', ' ', ' ', ' ', '#', ' ', '#'],
    ['#', '#', '#', '#', ' ', ' ', ' ', '#'],
    ['#', '#', '#', '#', '#', '#', '#', '#'],
  ];

  int linhaJogador = 1;
  int colunaJogador = 1;

  while (true) {
    mostrarMapa(mapa);
    stdout.write('Digite W, A, S ou D para mover: ');
    final comando = (stdin.readLineSync() ?? '').toUpperCase();

    int novaLinha = linhaJogador;
    int novaColuna = colunaJogador;

    if (comando == 'W') {
      novaLinha--;
    } else if (comando == 'S') {
      novaLinha++;
    } else if (comando == 'A') {
      novaColuna--;
    } else if (comando == 'D') {
      novaColuna++;
    } else {
      stdout.writeln('Comando invalido.');
      stdout.writeln('');
      continue;
    }

    final destino = mapa[novaLinha][novaColuna];

    if (destino == '#') {
      stdout.writeln('Tem uma parede nesse caminho.');
      stdout.writeln('');
      continue;
    }

    mapa[linhaJogador][colunaJogador] = ' ';
    linhaJogador = novaLinha;
    colunaJogador = novaColuna;

    if (destino == 'E') {
      mapa[linhaJogador][colunaJogador] = 'P';
      mostrarMapa(mapa);
      stdout.writeln('Voce chegou na saida!');
      break;
    }

    mapa[linhaJogador][colunaJogador] = 'P';
    stdout.writeln('');
  }
}

void mostrarMapa(List<List<String>> mapa) {
  stdout.writeln('');

  for (final linha in mapa) {
    stdout.writeln(linha.join(' '));
  }

  stdout.writeln('');
}
