import 'package:maior_chance/generate_game/usercases/open_file.dart';

class CacheOldGame {
  static final CacheOldGame _cacheOldGame = CacheOldGame._internal();

  CacheOldGame._internal();

  factory CacheOldGame() {
    return _cacheOldGame;
  }

  List<int> _bettingRaffle = [];
  List<int> _bettingRaffleLoto1 = [];
  List<int> _bettingRaffleLoto2 = [];

  Future<void> loadBetting() async {
    OpenFile openFile = OpenFile();
    _bettingRaffle = await openFile.buildBettingRaffle();
    List<dynamic> bettingRaffleLoto = await openFile.buildBettingRaffleLoto();

    _bettingRaffleLoto1 = bettingRaffleLoto[0];
    _bettingRaffleLoto2 = bettingRaffleLoto[1];
  }

  List<int> get bettingRaffle => _bettingRaffle;
  List<int> get bettingRaffleLoto1 => _bettingRaffleLoto1;
  List<int> get bettingRaffleLoto2 => _bettingRaffleLoto2;
}
