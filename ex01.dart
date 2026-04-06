import 'dart:io';

void main() {
  const boloPrecos = {
    'ovos': 5.5,
    'chocolate': 7.5,
    'cenoura': 6.5,
  };

  stdout.writeln('Cardapio:');
  boloPrecos.forEach((nome, preco) {
    stdout.writeln('$nome -> R\$${preco.toStringAsFixed(2)}');
  });

  stdout.write('Digite os bolos do pedido separados por virgula: ');
  final entrada = stdin.readLineSync() ?? '';

  final ordem = entrada
      .split(',')
      .map((item) => item.trim().toLowerCase())
      .where((item) => item.isNotEmpty)
      .toList();

  double total = 0;

  for (final bolo in ordem) {
    if (boloPrecos.containsKey(bolo)) {
      total += boloPrecos[bolo]!;
    } else {
      stdout.writeln('$bolo nao esta no cardapio');
    }
  }

  stdout.writeln('Total = ${total.toStringAsFixed(1)}');
}
