import 'package:flutter/material.dart';
import 'package:maior_chance/generate_game/usercases/betting.dart';
import 'package:maior_chance/generate_game/usercases/cache_old_game.dart';
import 'package:maior_chance/generate_game/usercases/find_betting.dart';
import 'package:maior_chance/generate_game/usercases/selected.dart';
import 'package:maior_chance/widgets/radiobox/radio_option_enum.dart';
import 'package:maior_chance/widgets/radiobox/radiobox_widgets.dart';

// ignore: must_be_immutable
class GenereteGamePage extends StatelessWidget {
  GenereteGamePage({super.key});

  Selected selected = Selected(id: 1, size: 60, limit: 5, state: true);
  RadioOptionEnum radioOptionEnum = RadioOptionEnum.megasena;

  final ValueNotifier<List<int>> game = ValueNotifier<List<int>>([]);
  final ValueNotifier<String> message = ValueNotifier<String>('');
  final ValueNotifier<bool> oldGame = ValueNotifier<bool>(false);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maior Chance'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RadioboxWidgets(onClick: (value) => selected = value),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          message.value = '';
                          game.value = Betting(size: selected.size, limit: selected.limit).create();
                        },
                        child: const Text(
                          'Gerar Jogo',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      margin: EdgeInsets.only(right: 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          if (game.value.isEmpty) return;

                          dynamic gameIsExist;

                          if (selected.id == 1) {
                            gameIsExist = FindBetting().find(CacheOldGame().bettingRaffle, int.parse(game.value.join('')));
                          } else {
                            var result1 = FindBetting().find(CacheOldGame().bettingRaffleLoto1, int.parse(game.value.sublist(0, 8).join('')));
                            var result2 = FindBetting().find(CacheOldGame().bettingRaffleLoto2, int.parse(game.value.sublist(8, 14).join('')));

                            if (result1 != null && result2 != null) gameIsExist = true;
                          }

                          message.value = gameIsExist != null ? 'Já sortedo' : 'Boa sorte!!!';
                        },
                        child: const Text(
                          'Verificar jogo',
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              ValueListenableBuilder<dynamic>(
                valueListenable: game,
                builder: (BuildContext context, dynamic value, child) {
                  if (value.isEmpty) return SizedBox();

                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text('Jogo: ${value.join(', ')}'),
                  );
                },
              ),
              ValueListenableBuilder<dynamic>(
                valueListenable: message,
                builder: (BuildContext context, dynamic value, child) {
                  if (value == null) return SizedBox();

                  return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Text(message.value),
                  );
                },
              ),
            ],
          ),
        ),
      ),
      persistentFooterButtons: [
        Column(
          children: [
            Container(
              width: double.maxFinite,
              margin: EdgeInsets.only(right: 15),
              child: ElevatedButton(
                onPressed: () async {
                  oldGame.value = false;
                  await CacheOldGame().loadBetting().whenComplete(() => oldGame.value = true);
                },
                child: const Text(
                  'Carregar números já sorteados',
                  style: TextStyle(color: Colors.grey),
                ),
              ),
            ),
            ValueListenableBuilder<bool>(
              valueListenable: oldGame,
              builder: (BuildContext context, bool value, child) {
                if (!value) return SizedBox();

                return SizedBox(
                  width: double.maxFinite,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Carregado mega sena'),
                      Text('Carregado lotofácil'),
                    ],
                  ),
                );
              },
            ),
          ],
        ),
      ],
    );
  }
}
