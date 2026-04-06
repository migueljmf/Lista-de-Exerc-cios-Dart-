import 'dart:io';

void main() {
  stdout.write('Digite a quantidade de termos: ');
  final termos = int.parse(stdin.readLineSync() ?? '0');

  double soma = 0;
  int numerador = 3;
  int numeroFatorial = 4;

  for (int i = 1; i <= termos; i++) {
    final valorTermo = numerador / fatorial(numeroFatorial);

    if (i <= 3) {
      soma += valorTermo;
    } else if (i.isEven) {
      soma -= valorTermo;
    } else {
      soma += valorTermo;
    }

    numerador += 2;
    numeroFatorial += 4;
  }

  stdout.writeln('Valor da serie = $soma');
}

int fatorial(int numero) {
  int resultado = 1;

  for (int i = 2; i <= numero; i++) {
    resultado *= i;
  }

  return resultado;
}
