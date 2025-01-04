import 'package:flutter/material.dart';

class ExpansionTileWidgets extends StatefulWidget {
  const ExpansionTileWidgets({
    super.key,
    required this.label,
    required this.onClickGeneratesGame,
    required this.onClickCompare,
  });

  final String label;
  final List<int> Function() onClickGeneratesGame;
  final Function(List<int>) onClickCompare;

  @override
  State<ExpansionTileWidgets> createState() => _ExpansionTileWidgetsState();
}

class _ExpansionTileWidgetsState extends State<ExpansionTileWidgets> {
  List<int> game = [];

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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      height: 25,
                      margin: EdgeInsets.only(left: 15, right: 15),
                      child: ElevatedButton(
                        onPressed: () async {
                          game = widget.onClickGeneratesGame();
                          setState(() {});
                        },
                        child: const Text('Gerar números', style: TextStyle(color: Colors.grey)),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      width: double.maxFinite,
                      height: 20,
                      margin: EdgeInsets.only(right: 15),
                      /* child: ElevatedButton(
                        onPressed: () async {
                          if (game.isEmpty) return;
                          widget.onClickCompare(game);
                          setState(() {});
                        },
                        child: const Text('Verificar jogo', style: TextStyle(color: Colors.grey)),
                      ),*/
                    ),
                  ),
                ],
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
            ],
          ),
        ],
      ),
    );
  }
}
