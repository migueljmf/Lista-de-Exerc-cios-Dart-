void main() {
  for (int numero = 1000; numero <= 9999; numero++) {
    final parte1 = numero ~/ 100;
    final parte2 = numero % 100;
    final soma = parte1 + parte2;

    if (soma * soma == numero) {
      print(numero);
    }
  }
}
