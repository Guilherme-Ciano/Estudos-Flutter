import 'package:aula_01/questao.dart';
import 'package:aula_01/resposta.dart';
import 'package:flutter/material.dart';

class Questionario extends StatelessWidget {
  final List<Map<String, Object>> perguntas;
  final int perguntaSelecionada;
  final void Function(int) respostaUser;

  Questionario({
    required this.perguntas,
    required this.perguntaSelecionada,
    required this.respostaUser,
  });

  bool get temPerguntaSelecionada {
    return perguntaSelecionada < perguntas.length;
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, Object>>? respostas = temPerguntaSelecionada
        ? perguntas[perguntaSelecionada]['respostas']
            as List<Map<String, Object>>
        : null;

    return Column(
      children: <Widget>[
        Questao(perguntas[perguntaSelecionada]['texto'].toString()),
        ...respostas!
            .map((resp) => Resposta(resp['texto'].toString(),
                () => respostaUser(int.parse(resp['pontuacao'].toString()))))
            .toList(),
      ],
    );
  }
}
