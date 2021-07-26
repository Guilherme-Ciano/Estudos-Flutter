import 'package:flutter/material.dart';
import 'package:aula_01/questionario.dart';
import 'package:aula_01/resultado.dart';

main() {
  runApp(new PerguntaApp());
}

class _PerguntaAppState extends State<PerguntaApp> {
  var _perguntaSelecionada = 0;
  var _pontuacaoTotal = 0;

  final _perguntas = const [
    {
      'texto': 'Qual é a sua cor favorita?',
      'respostas': [
        {'texto': 'preto', 'pontuacao': 30},
        {'texto': 'azul', 'pontuacao': 40},
        {'texto': 'vermelho', 'pontuacao': 20},
        {'texto': 'roxo', 'pontuacao': 10},
      ],
    },
    {
      'texto': 'Qual é o seu animal favorito?',
      'respostas': [
        {'texto': 'Lobo', 'pontuacao': 40},
        {'texto': 'Leão', 'pontuacao': 10},
        {'texto': 'Cachorro', 'pontuacao': 30},
        {'texto': 'Gato', 'pontuacao': 20},
      ],
    },
    {
      'texto': 'Qual é a sua idade?',
      'respostas': [
        {'texto': '17', 'pontuacao': 40},
        {'texto': '12', 'pontuacao': 10},
        {'texto': '6', 'pontuacao': 30},
        {'texto': '44', 'pontuacao': 20},
      ],
    }
  ];

  void _responder(int pontuacao) {
    if (temPerguntaSelecionada) {
      setState(() {
        _perguntaSelecionada++;
        _pontuacaoTotal += pontuacao;
      });

      print('Pontuação => $_pontuacaoTotal');
    }
  }

  void _reiniciarQuestionario() {
    setState(() {
      _perguntaSelecionada = 0;
      _pontuacaoTotal = 0;
    });
  }

  bool get temPerguntaSelecionada {
    return _perguntaSelecionada < _perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
          appBar: AppBar(
            title: Text('Perguntas'),
          ),

          // * Corpo do App
          body: temPerguntaSelecionada
              ? Questionario(
                  perguntas: _perguntas,
                  perguntaSelecionada: _perguntaSelecionada,
                  respostaUser: _responder,
                )
              : Resultado(_pontuacaoTotal, _reiniciarQuestionario)),
    );
  }
}

class PerguntaApp extends StatefulWidget {
  _PerguntaAppState createState() {
    return _PerguntaAppState();
  }
}
