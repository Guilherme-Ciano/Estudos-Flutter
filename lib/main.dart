import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

main() {
  runApp(new PerguntaApp());
}

class PerguntaAppState extends State<PerguntaApp> {
  var perguntaSelecionada = 0;

  void responder() {
    // Altera o texto de acordo com o valor
    setState(() {
      perguntaSelecionada++;
    });

    print(perguntaSelecionada);
  }

  Widget build(BuildContext context) {
    // Iniciando o app

    @override
    final perguntas = [
      'Qual é a sua cor favorita?',
      'Qual é o seu animal favorito?'
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas'),
        ),

        // * Corpo do App
        body: Column(
          children: [
            Text(perguntas[perguntaSelecionada]),

            // * Botão 1
            ElevatedButton(
              child: Text('Pergunta 01'),
              onPressed: responder,
            ),

            // * Botão 2
            ElevatedButton(
              child: Text('Resposta 02'),
              onPressed: responder,
            ),

            // * Botão 3
            ElevatedButton(
              child: Text('Resposta 03'),
              onPressed: responder,
            ),

            //
          ],
        ),
      ),
    );
  }
}

// Transformando o widget Stateless em Stateful
class PerguntaApp extends StatefulWidget {
  PerguntaAppState createState() {
    return PerguntaAppState();
  }
}
