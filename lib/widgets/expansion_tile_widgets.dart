import 'package:flutter/material.dart';
import 'package:maior_chance/database/app_database.dart';
import 'package:maior_chance/generate_game/entities/lottery.dart';

class ExpansionTileWidgets extends StatefulWidget {
  const ExpansionTileWidgets({
    super.key,
    required this.label,
    required this.onClickGeneratesGame,
    required this.onClickInsert,
    required this.type,
  });

  final String label;
  final List<int> Function() onClickGeneratesGame;
  final Function(List<int>) onClickInsert;
  final int type;

  @override
  State<ExpansionTileWidgets> createState() => _ExpansionTileWidgetsState();
}

class _ExpansionTileWidgetsState extends State<ExpansionTileWidgets> {
  List<int> game = [];

  Future<List<Lottery>?> fintLotteryByType() async {
    AppDatabase appDatabase = await getInstance();
    return await appDatabase.lotteryDao.fintLotteryByType(widget.type);
  }

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
      ),
      clipBehavior: Clip.antiAlias,
      margin: EdgeInsets.all(2),
      child: ExpansionTile(
        initiallyExpanded: false,
        title: Text(widget.label, style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500)),
        backgroundColor: Colors.white,
        collapsedBackgroundColor: Colors.white,
        shape: Border(),
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(20, 25),
                      ),
                      onPressed: () {
                        game = widget.onClickGeneratesGame();
                        setState(() {});
                      },
                      child: const Text('Gerar números', style: TextStyle(color: Colors.black87)),
                    ),
                    Visibility(
                      visible: game.isNotEmpty,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(60, 25),
                        ),
                        onPressed: () {
                          widget.onClickInsert(game);
                          setState(() => game = []);
                        },
                        child: const Text('Salvar jogo', style: TextStyle(color: Colors.black87)),
                      ),
                    ),
                  ],
                ),
              ),
              Visibility(
                visible: game.isNotEmpty,
                child: Padding(
                  padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                  child: Text('Seus números da sorte!'),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                child: Text(game.join(' - ')),
              ),
              FutureBuilder(
                future: fintLotteryByType(),
                builder: (BuildContext context, AsyncSnapshot<List<Lottery>?> snapshot) {
                  if (snapshot.hasData) {
                    if (snapshot.data!.isNotEmpty) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 15.0),
                            child: Text('Jogos registrados', style: TextStyle(fontSize: 18)),
                          ),
                          ListView.separated(
                            itemCount: snapshot.data!.length,
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            separatorBuilder: (context, index) {
                              return const Divider(endIndent: 15, indent: 15, height: 1, color: Colors.black12);
                            },
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(left: 15, right: 15),
                                child: Text(snapshot.data![index].toString()),
                              );
                            },
                          ),
                        ],
                      );
                    } else {
                      return const Center(
                        child: Text(
                          "Não há jogos registrado!!!",
                          style: TextStyle(fontSize: 18, color: Colors.black54, fontWeight: FontWeight.w300),
                        ),
                      );
                    }
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
