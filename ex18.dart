import 'dart:io';
import 'dart:math';

void main() {
  final palavras = ['dart', 'faculdade', 'programacao', 'celular', 'algoritmo'];
  final palavra = palavras[Random().nextInt(palavras.length)].toUpperCase();

  final letrasDescobertas = <String>{};
  final letrasErradas = <String>{};
  const maxErros = 6;

  while (true) {
    stdout.writeln(desenhos[letrasErradas.length]);
    stdout.writeln('Palavra: ${montarPalavra(palavra, letrasDescobertas)}');
    stdout.writeln('Letras erradas: ${letrasErradas.join(' ')}');
    stdout.write('Digite uma letra: ');

    final entrada = (stdin.readLineSync() ?? '').toUpperCase();

    if (entrada.isEmpty) {
      stdout.writeln('Digite alguma letra.');
      stdout.writeln('');
      continue;
    }

    final letra = entrada[0];

    if (letrasDescobertas.contains(letra) || letrasErradas.contains(letra)) {
      stdout.writeln('Essa letra ja foi digitada.');
      stdout.writeln('');
      continue;
    }

    if (palavra.contains(letra)) {
      letrasDescobertas.add(letra);
    } else {
      letrasErradas.add(letra);
    }

    if (palavraCompleta(palavra, letrasDescobertas)) {
      stdout.writeln(desenhos[letrasErradas.length]);
      stdout.writeln('Palavra: $palavra');
      stdout.writeln('Voce venceu!');
      break;
    }

    if (letrasErradas.length == maxErros) {
      stdout.writeln(desenhos[maxErros]);
      stdout.writeln('Voce perdeu. A palavra era: $palavra');
      break;
    }

    stdout.writeln('');
  }
}

String montarPalavra(String palavra, Set<String> letrasDescobertas) {
  final partes = <String>[];

  for (final letra in palavra.split('')) {
    if (letrasDescobertas.contains(letra)) {
      partes.add(letra);
    } else {
      partes.add('_');
    }
  }

  return partes.join(' ');
}

bool palavraCompleta(String palavra, Set<String> letrasDescobertas) {
  for (final letra in palavra.split('')) {
    if (!letrasDescobertas.contains(letra)) {
      return false;
    }
  }

  return true;
}

const desenhos = [
  '''
 +---+
 |   |
     |
     |
     |
     |
=========
''',
  '''
 +---+
 |   |
 O   |
     |
     |
     |
=========
''',
  '''
 +---+
 |   |
 O   |
 |   |
     |
     |
=========
''',
  '''
 +---+
 |   |
 O   |
/|   |
     |
     |
=========
''',
  '''
 +---+
 |   |
 O   |
/|\\  |
     |
     |
=========
''',
  '''
 +---+
 |   |
 O   |
/|\\  |
/    |
     |
=========
''',
  '''
 +---+
 |   |
 O   |
/|\\  |
/ \\  |
     |
=========
''',
];
