import 'package:flutter/material.dart';

class Resultado extends StatelessWidget {
  final int pontuacao;

  Resultado(this.pontuacao);

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
    return Center(
      child: Text(
        fraseResultado,
        style: TextStyle(fontSize: 28),
      ),
    );
  }
}
