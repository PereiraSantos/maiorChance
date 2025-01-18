import 'dart:async';

import 'package:maior_chance/dao/lottery_dao.dart';
import 'package:maior_chance/generate_game/entities/lottery.dart';
// ignore: depend_on_referenced_packages
import 'package:sqflite/sqflite.dart' as sqflite;

import 'package:floor/floor.dart';

part 'app_database.g.dart';

@Database(version: 1, entities: [
  Lottery,
])
abstract class AppDatabase extends FloorDatabase {
  LotteryDao get lotteryDao;
}

Future<AppDatabase> getInstance() async {
  return await $FloorAppDatabase.databaseBuilder('app_database.db').build();
}
