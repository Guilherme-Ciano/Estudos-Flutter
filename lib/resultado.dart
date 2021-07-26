import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;
  final void Function() quandoReiniciarQuestionario;

  Resultado(
    this.pontuacao,
    this.quandoReiniciarQuestionario,
  );

  String get fraseResultado {
    if (pontuacao < 80) {
      return ('Parabéns!');
    } else if (pontuacao < 120) {
      return ('Grande Partida!');
    } else {
      return ('Explêndido!');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Center(
          child: Text(
            fraseResultado,
            style: TextStyle(fontSize: 28),
          ),
        ),
        TextButton(
          onPressed: quandoReiniciarQuestionario,
          child: Text(
            'Reiniciar?',
            style: TextStyle(
              fontSize: 24,
              color: Colors.blue,
            ),
          ),
        )
      ],
    );
  }
}
