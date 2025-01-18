import 'package:flutter/material.dart';
import 'package:maior_chance/database/app_database.dart';
import 'package:maior_chance/generate_game/entities/lottery.dart';
import 'package:maior_chance/generate_game/usercases/betting.dart';
import 'package:maior_chance/generate_game/usercases/cache_old_game.dart';
import 'package:maior_chance/generate_game/usercases/find_betting.dart';
import 'package:maior_chance/utils/message_user.dart';
import 'package:maior_chance/widgets/expansion_tile_widgets.dart';

// ignore: must_be_immutable
class GenereteGamePage extends StatelessWidget {
  GenereteGamePage({super.key}) {
    CacheOldGame().loadBetting();
  }

  List<int> genereteGameBetting(int stop) {
    var betting = Betting(size: 60, limit: 5).create();

    var result = FindBetting().find(CacheOldGame().bettingRaffle, int.parse(betting.join()));

    if (result == null || stop == 0) return betting;
    stop--;
    return genereteGameBetting(stop);
  }

  List<int> genereteGameLoto(int stop) {
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
                onClickInsert: (List<int> game) async {
                  AppDatabase appDatabase = await getInstance();

                  appDatabase.lotteryDao
                      .insertLottery(Lottery(type: 1, one: game[0], two: game[1], three: game[2], four: game[3], five: game[4], six: game[5]));

                  // ignore: use_build_context_synchronously
                  MessageUser.message(context, 'Registrado com sucesso!!!');
                },
                type: 1,
              ),
              ExpansionTileWidgets(
                label: 'Lotofácil',
                onClickGeneratesGame: () => genereteGameLoto(10),
                onClickInsert: (List<int> game) async {
                  AppDatabase appDatabase = await getInstance();

                  appDatabase.lotteryDao.insertLottery(
                    Lottery(
                      type: 2,
                      one: game[0],
                      two: game[1],
                      three: game[2],
                      four: game[3],
                      five: game[4],
                      six: game[5],
                      seven: game[6],
                      eight: game[7],
                      nine: game[8],
                      ten: game[9],
                      eleven: game[10],
                      twelve: game[11],
                      thirteen: game[12],
                      fourteen: game[13],
                      fifteen: game[14],
                    ),
                  );

                  // ignore: use_build_context_synchronously
                  MessageUser.message(context, 'Registrado com sucesso!!!');
                },
                type: 2,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
