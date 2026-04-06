import 'dart:io';

void main() {
  stdout.write('Digite o valor de X: ');
  final x = double.parse(stdin.readLineSync() ?? '0');

  stdout.write('Digite a quantidade de termos: ');
  final termos = int.parse(stdin.readLineSync() ?? '0');

  double soma = 0;
  int expoente = 2;
  int divisor = 1;
  int direcao = 1;

  for (int i = 0; i < termos; i++) {
    soma += potencia(x, expoente) / fatorial(divisor);

    expoente++;

    if (divisor == 4) {
      direcao = -1;
    } else if (divisor == 1) {
      direcao = 1;
    }

    divisor += direcao;
  }

  stdout.writeln('Valor da serie = $soma');
}

double potencia(double base, int expoente) {
  double resultado = 1;

  for (int i = 0; i < expoente; i++) {
    resultado *= base;
  }

  return resultado;
}

int fatorial(int numero) {
  int resultado = 1;

  for (int i = 2; i <= numero; i++) {
    resultado *= i;
  }

  return resultado;
}
