import 'dart:collection';

import 'package:maior_chance/generate_game/usercases/open_file.dart';

class CacheOldGame {
  static final CacheOldGame _cacheOldGame = CacheOldGame._internal();

  CacheOldGame._internal();

  factory CacheOldGame() {
    return _cacheOldGame;
  }

  Map<String, String> _bettingRaffle = HashMap();
  Map<String, String> _bettingRaffleLoto = HashMap();

  Future<void> loadBetting() async {
    OpenFile openFile = OpenFile();
    _bettingRaffle = await openFile.buildBettingRaffle();
    _bettingRaffleLoto = await openFile.buildBettingRaffleLoto();
  }

  Map<String, String> get bettingRaffle => _bettingRaffle;
  Map<String, String> get bettingRaffleLoto => _bettingRaffleLoto;
}
