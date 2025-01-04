import 'package:flutter/material.dart';
import 'package:maior_chance/generate_game/usercases/betting.dart';
import 'package:maior_chance/generate_game/usercases/cache_old_game.dart';
import 'package:maior_chance/generate_game/usercases/find_betting.dart';
import 'package:maior_chance/widgets/expansion_tile_widgets.dart';

// ignore: must_be_immutable
class GenereteGamePage extends StatelessWidget {
  GenereteGamePage({super.key}) {
    CacheOldGame().loadBetting();
  }

  genereteGameBetting(int stop) {
    var betting = Betting(size: 60, limit: 5).create();

    var result = FindBetting().find(CacheOldGame().bettingRaffle, int.parse(betting.join()));

    if (result == null || stop == 0) return betting;
    stop--;
    return genereteGameBetting(stop);
  }

  genereteGameLoto(int stop) {
    var betting = Betting(size: 25, limit: 15).create();

    var result1 = FindBetting().find(CacheOldGame().bettingRaffleLoto1, int.parse(betting.sublist(0, 8).join('')));
    var result2 = FindBetting().find(CacheOldGame().bettingRaffleLoto2, int.parse(betting.sublist(8, 14).join('')));

    if (result1 == null || result2 == null || stop == 0) return betting;
    stop--;
    return genereteGameLoto(stop);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Maior Chance'),
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(left: 15, right: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ExpansionTileWidgets(
                label: 'Mega sena',
                onClickGeneratesGame: () => genereteGameBetting(10),
                onClickCompare: (List<int> game) => FindBetting().find(CacheOldGame().bettingRaffle, int.parse(game.join(''))),
              ),
              ExpansionTileWidgets(
                label: 'Lotofácil',
                onClickGeneratesGame: () => genereteGameLoto(10),
                onClickCompare: (List<int> game) {
                  var result1 = FindBetting().find(CacheOldGame().bettingRaffleLoto1, int.parse(game.sublist(0, 8).join('')));
                  var result2 = FindBetting().find(CacheOldGame().bettingRaffleLoto2, int.parse(game.sublist(8, 14).join('')));
                  return result1 + result2;
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
