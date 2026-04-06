import 'dart:io';
import 'dart:math';

void main() {
  final random = Random();
  final numeroSecreto = random.nextInt(100) + 1;

  int limiteInferior = 0;
  int limiteSuperior = 100;
  int tentativa = 0;

  stdout.writeln('Jogo de adivinhacao');

  while (true) {
    stdout.writeln('O numero esta entre $limiteInferior e $limiteSuperior');
    stdout.write('Digite seu palpite: ');
    final chute = int.parse(stdin.readLineSync() ?? '0');
    tentativa++;

    if (chute == numeroSecreto) {
      stdout.writeln('Acertou em $tentativa tentativa(s).');
      break;
    }

    if (chute < numeroSecreto) {
      if (chute > limiteInferior) {
        limiteInferior = chute;
      }
      stdout.writeln('O numero e maior.');
    } else {
      if (chute < limiteSuperior) {
        limiteSuperior = chute;
      }
      stdout.writeln('O numero e menor.');
    }

    stdout.writeln('');
  }
}
