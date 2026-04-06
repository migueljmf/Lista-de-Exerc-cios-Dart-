import 'dart:io';

void main() {
  stdout.write('Digite a quantidade de termos da serie: ');
  final quantidade = int.parse(stdin.readLineSync() ?? '0');

  int primeiro = 1;
  int segundo = 5;
  int terceiro = 100;
  int contador = 0;

  stdout.writeln('Serie gerada:');

  while (contador < quantidade) {
    stdout.write('$primeiro ');
    contador++;
    if (contador >= quantidade) {
      break;
    }

    stdout.write('$segundo ');
    contador++;
    if (contador >= quantidade) {
      break;
    }

    stdout.write('$terceiro ');
    contador++;

    primeiro *= 2;
    segundo += 5;
    terceiro -= 10;
  }

  stdout.writeln('');
}
