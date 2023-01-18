import 'dart:math';

class Words {
  List<String> easy = [
    'LAR',
    'AMO',
    'SOM',
    'REI',
    'BOA',
    'ECO',
    'AMOR',
    'FATO',
    'MITO',
    'CAOS',
    'SEDE',
    'VIDA',
    'DOCE',
    'SAGAZ',
    'MEXER',
    'TERMO',
    'NOBRE',
    'SENSO',
    'AFETO',
    'PLENA',
  ];

  List<String> medium = [
    'SUBLIME',
    'SUCINTO',
    'INFERIR',
    'REDIMIR',
    'RECESSO',
    'ESTIGMA',
    'CULTURA',
    'REFUTAR',
    'VIRTUDE',
    'ADEMAIS',
    'ALMEJAR',
    'ORGULHO',
    'SENSATO',
    'CORAGEM',
    'QUIMERA',
    'EXCESSO',
    'SAUDADE',
    'PARCIAL',
    'MODESTO',
    'AMIZADE',
    'DEMANDA',
  ];

  List<String> hard = [
    'MINUCIOSAMENTE',
    'INTERMUNICIPAL',
    'INDISCRIMINADO',
    'FREQUENTEMENTE',
    'PERMISSIVIDADE',
    'SOBRECARREGADO',
    'SEMIANALFABETO',
    'ACESSIBILIDADE',
    'CONSTANTEMENTE',
    'MULTIPLICIDADE',
    'RECIPROCIDADE',
    'INCONVENIENTE',
    'DISCERNIMENTO',
    'SOLIDARIEDADE',
    'INTRANSIGENTE',
    'CREDIBILIDADE',
    'APROVISIONADO',
    'TRANSCENDENTE',
    'RESSIGNIFICAR',
    'ESTEREOTIPADO',
  ];

  String getEasyWord() {
    final int wordLength = easy.length;
    return easy[Random().nextInt(wordLength)];
  }

  String getMediumWord() {
    final int wordLength = medium.length;
    return medium[Random().nextInt(wordLength)];
  }

  String getHardWord() {
    final int wordLength = hard.length;
    return hard[Random().nextInt(wordLength)];
  }
}
