import 'package:floor/floor.dart';
import 'package:maior_chance/generate_game/entities/lottery.dart';

@dao
abstract class LotteryDao {
  @Query('SELECT * FROM lottery where type = :type')
  Future<List<Lottery>?> fintLotteryByType(int type);

  @insert
  Future<int> insertLottery(Lottery question);

  @update
  Future<int> updateLottery(Lottery lottery);
}
