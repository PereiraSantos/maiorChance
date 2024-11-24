import 'dart:isolate';
import 'package:flutter/material.dart';
import 'package:maior_chance/generate_game/usercases/build_game.dart';

// ignore: must_be_immutable
class GenereteGamePage extends StatelessWidget {
  GenereteGamePage({super.key});

  BuildGame buildGame = BuildGame(20);
  ReceivePort receivePort = ReceivePort();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maior Chance'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            StreamBuilder(
              stream: receivePort,
              builder: (context, snapshot) => Text('Jogo: ${snapshot.data ?? ''}'),
            ),
            ElevatedButton(
              onPressed: () async => await Isolate.spawn(buildGame.getList, receivePort.sendPort),
              child: const Text(
                'Gerar Jogo',
                style: TextStyle(color: Colors.grey),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
