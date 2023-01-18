import 'package:flutter/material.dart';
import 'package:flutter_phoenix/flutter_phoenix.dart';
import 'package:jogo_descobrir_palavra/util/words.dart';

class GameScreen extends StatefulWidget {
  const GameScreen({super.key, required this.level});

  final String level;

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  @override
  void initState() {
    setUndercores();
    super.initState();
  }

  int life = 5;

  //Lista com undercores exibidos na tela
  List<String> word2 = ['_'];

  //Lista com letras já clicadas
  List<String> clicked = ['_'];

  String word = '_';

  //tamanho da palavra pra verificações
  int wordLength = 0;

  //numero de letras aceitas para verificar se foi acertada
  int acceptLetters = 0;

  void setUndercores() {
    word2.clear();
    if (widget.level == 'easy') {
      setState(() {
        word = Words().getEasyWord();
        wordLength = word.length;
      });
      for (int i = 0; i < word.length; i++) {
        setState(() {
          word2.add('_');
        });
      }
    } else if (widget.level == 'medium') {
      setState(() {
        word = Words().getMediumWord();
        wordLength = word.length;
      });
      for (int i = 0; i < word.length; i++) {
        setState(() {
          word2.add('_');
        });
      }
    } else {
      setState(() {
        word = Words().getHardWord();
        wordLength = word.length;
      });
      for (int i = 0; i < word.length; i++) {
        setState(() {
          word2.add('_');
        });
      }
    }
  }

  void checkIfContainsLetter(String letter) {
    for (int i = 0; i < wordLength; i++) {
      if (word[i] == letter) {
        setState(() {
          word2[i] = letter;
          acceptLetters++;
          clicked.add(letter);
        });
        checkIfWin();
        checkLife();
      }
    }
    if (!word.contains(letter)) {
      setState(() {
        life--;
        clicked.add(letter);
      });
      checkLife();
    }
  }

  void checkIfWin() {
    if (acceptLetters == word.length) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Parabéns'),
            content: const Text('Você conseguiu descobrir a palavra!!!'),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Jogar Novamente'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(
                        level: widget.level,
                      ),
                    ),
                    ModalRoute.withName('menu'),
                  );
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Voltar ao Menu'),
                onPressed: () {
                  Phoenix.rebirth(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  void checkLife() {
    if (life == 0) {
      showDialog<void>(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Opss!!'),
            content: Text('Não foi dessa vez\n\n'
                'A palavra era $word'),
            actions: <Widget>[
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Jogar Novamente'),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(
                      builder: (context) => GameScreen(
                        level: widget.level,
                      ),
                    ),
                    ModalRoute.withName('menu'),
                  );
                },
              ),
              TextButton(
                style: TextButton.styleFrom(
                  textStyle: Theme.of(context).textTheme.labelLarge,
                ),
                child: const Text('Voltar ao Menu'),
                onPressed: () {
                  Phoenix.rebirth(context);
                },
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DESCUBRA A PALAVRA'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                life >= 1 ? Icons.favorite : Icons.heart_broken,
                color: Colors.red,
                size: 40,
              ),
              Icon(
                life >= 2 ? Icons.favorite : Icons.heart_broken,
                color: Colors.red,
                size: 40,
              ),
              Icon(
                life >= 3 ? Icons.favorite : Icons.heart_broken,
                color: Colors.red,
                size: 40,
              ),
              Icon(
                life >= 4 ? Icons.favorite : Icons.heart_broken,
                color: Colors.red,
                size: 40,
              ),
              Icon(
                life == 5 ? Icons.favorite : Icons.heart_broken,
                color: Colors.red,
                size: 40,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: word2
                .map(
                  (e) => Text(
                    e,
                    style: const TextStyle(
                      fontSize: 45,
                    ),
                  ),
                )
                .toList(),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              height: 300,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('Q')
                              ? null
                              : () => checkIfContainsLetter('Q'),
                          child: const Text('Q'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('W')
                              ? null
                              : () => checkIfContainsLetter('W'),
                          child: const Text('W'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('E')
                              ? null
                              : () => checkIfContainsLetter('E'),
                          child: const Text('E'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('R')
                              ? null
                              : () => checkIfContainsLetter('R'),
                          child: const Text('R'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('T')
                              ? null
                              : () => checkIfContainsLetter('T'),
                          child: const Text('T'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('Y')
                              ? null
                              : () => checkIfContainsLetter('Y'),
                          child: const Text('Y'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('U')
                              ? null
                              : () => checkIfContainsLetter('U'),
                          child: const Text('U'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('I')
                              ? null
                              : () => checkIfContainsLetter('I'),
                          child: const Text('I'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('O')
                              ? null
                              : () => checkIfContainsLetter('O'),
                          child: const Text('O'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('P')
                              ? null
                              : () => checkIfContainsLetter('P'),
                          child: const Text('P'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('A')
                              ? null
                              : () => checkIfContainsLetter('A'),
                          child: const Text('A'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('S')
                              ? null
                              : () => checkIfContainsLetter('S'),
                          child: const Text('S'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('D')
                              ? null
                              : () => checkIfContainsLetter('D'),
                          child: const Text('D'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('F')
                              ? null
                              : () => checkIfContainsLetter('F'),
                          child: const Text('F'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('G')
                              ? null
                              : () => checkIfContainsLetter('G'),
                          child: const Text('G'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('H')
                              ? null
                              : () => checkIfContainsLetter('H'),
                          child: const Text('H'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('J')
                              ? null
                              : () => checkIfContainsLetter('J'),
                          child: const Text('J'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('K')
                              ? null
                              : () => checkIfContainsLetter('K'),
                          child: const Text('K'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('L')
                              ? null
                              : () => checkIfContainsLetter('L'),
                          child: const Text('L'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('Ç')
                              ? null
                              : () => checkIfContainsLetter('Ç'),
                          child: const Text('Ç'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('Z')
                              ? null
                              : () => checkIfContainsLetter('Z'),
                          child: const Text('Z'),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('X')
                              ? null
                              : () => checkIfContainsLetter('X'),
                          child: const Text('X'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('C')
                              ? null
                              : () => checkIfContainsLetter('C'),
                          child: const Text('C'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('V')
                              ? null
                              : () => checkIfContainsLetter('V'),
                          child: const Text('V'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('B')
                              ? null
                              : () => checkIfContainsLetter('B'),
                          child: const Text('B'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('N')
                              ? null
                              : () => checkIfContainsLetter('N'),
                          child: const Text('N'),
                        ),
                      ),
                      SizedBox(
                        width: 50,
                        height: 50,
                        child: ElevatedButton(
                          onPressed: clicked.contains('M,')
                              ? null
                              : () => checkIfContainsLetter('M'),
                          child: const Text('M'),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
