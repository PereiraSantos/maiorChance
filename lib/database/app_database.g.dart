// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'app_database.dart';

// **************************************************************************
// FloorGenerator
// **************************************************************************

abstract class $AppDatabaseBuilderContract {
  /// Adds migrations to the builder.
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations);

  /// Adds a database [Callback] to the builder.
  $AppDatabaseBuilderContract addCallback(Callback callback);

  /// Creates the database and initializes it.
  Future<AppDatabase> build();
}

// ignore: avoid_classes_with_only_static_members
class $FloorAppDatabase {
  /// Creates a database builder for a persistent database.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract databaseBuilder(String name) =>
      _$AppDatabaseBuilder(name);

  /// Creates a database builder for an in memory database.
  /// Information stored in an in memory database disappears when the process is killed.
  /// Once a database is built, you should keep a reference to it and re-use it.
  static $AppDatabaseBuilderContract inMemoryDatabaseBuilder() =>
      _$AppDatabaseBuilder(null);
}

class _$AppDatabaseBuilder implements $AppDatabaseBuilderContract {
  _$AppDatabaseBuilder(this.name);

  final String? name;

  final List<Migration> _migrations = [];

  Callback? _callback;

  @override
  $AppDatabaseBuilderContract addMigrations(List<Migration> migrations) {
    _migrations.addAll(migrations);
    return this;
  }

  @override
  $AppDatabaseBuilderContract addCallback(Callback callback) {
    _callback = callback;
    return this;
  }

  @override
  Future<AppDatabase> build() async {
    final path = name != null
        ? await sqfliteDatabaseFactory.getDatabasePath(name!)
        : ':memory:';
    final database = _$AppDatabase();
    database.database = await database.open(
      path,
      _migrations,
      _callback,
    );
    return database;
  }
}

class _$AppDatabase extends AppDatabase {
  _$AppDatabase([StreamController<String>? listener]) {
    changeListener = listener ?? StreamController<String>.broadcast();
  }

  LotteryDao? _lotteryDaoInstance;

  Future<sqflite.Database> open(
    String path,
    List<Migration> migrations, [
    Callback? callback,
  ]) async {
    final databaseOptions = sqflite.OpenDatabaseOptions(
      version: 1,
      onConfigure: (database) async {
        await database.execute('PRAGMA foreign_keys = ON');
        await callback?.onConfigure?.call(database);
      },
      onOpen: (database) async {
        await callback?.onOpen?.call(database);
      },
      onUpgrade: (database, startVersion, endVersion) async {
        await MigrationAdapter.runMigrations(
            database, startVersion, endVersion, migrations);

        await callback?.onUpgrade?.call(database, startVersion, endVersion);
      },
      onCreate: (database, version) async {
        await database.execute(
            'CREATE TABLE IF NOT EXISTS `lottery` (`id` INTEGER PRIMARY KEY AUTOINCREMENT, `type` INTEGER, `one` INTEGER, `two` INTEGER, `three` INTEGER, `four` INTEGER, `five` INTEGER, `six` INTEGER, `seven` INTEGER, `eight` INTEGER, `nine` INTEGER, `ten` INTEGER, `eleven` INTEGER, `twelve` INTEGER, `thirteen` INTEGER, `fourteen` INTEGER, `fifteen` INTEGER)');

        await callback?.onCreate?.call(database, version);
      },
    );
    return sqfliteDatabaseFactory.openDatabase(path, options: databaseOptions);
  }

  @override
  LotteryDao get lotteryDao {
    return _lotteryDaoInstance ??= _$LotteryDao(database, changeListener);
  }
}

class _$LotteryDao extends LotteryDao {
  _$LotteryDao(
    this.database,
    this.changeListener,
  )   : _queryAdapter = QueryAdapter(database),
        _lotteryInsertionAdapter = InsertionAdapter(
            database,
            'lottery',
            (Lottery item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'one': item.one,
                  'two': item.two,
                  'three': item.three,
                  'four': item.four,
                  'five': item.five,
                  'six': item.six,
                  'seven': item.seven,
                  'eight': item.eight,
                  'nine': item.nine,
                  'ten': item.ten,
                  'eleven': item.eleven,
                  'twelve': item.twelve,
                  'thirteen': item.thirteen,
                  'fourteen': item.fourteen,
                  'fifteen': item.fifteen
                }),
        _lotteryUpdateAdapter = UpdateAdapter(
            database,
            'lottery',
            ['id'],
            (Lottery item) => <String, Object?>{
                  'id': item.id,
                  'type': item.type,
                  'one': item.one,
                  'two': item.two,
                  'three': item.three,
                  'four': item.four,
                  'five': item.five,
                  'six': item.six,
                  'seven': item.seven,
                  'eight': item.eight,
                  'nine': item.nine,
                  'ten': item.ten,
                  'eleven': item.eleven,
                  'twelve': item.twelve,
                  'thirteen': item.thirteen,
                  'fourteen': item.fourteen,
                  'fifteen': item.fifteen
                });

  final sqflite.DatabaseExecutor database;

  final StreamController<String> changeListener;

  final QueryAdapter _queryAdapter;

  final InsertionAdapter<Lottery> _lotteryInsertionAdapter;

  final UpdateAdapter<Lottery> _lotteryUpdateAdapter;

  @override
  Future<List<Lottery>?> fintLotteryByType(int type) async {
    return _queryAdapter.queryList('SELECT * FROM lottery where type = ?1',
        mapper: (Map<String, Object?> row) => Lottery(
            id: row['id'] as int?,
            type: row['type'] as int?,
            one: row['one'] as int?,
            two: row['two'] as int?,
            three: row['three'] as int?,
            four: row['four'] as int?,
            five: row['five'] as int?,
            six: row['six'] as int?,
            seven: row['seven'] as int?,
            eight: row['eight'] as int?,
            nine: row['nine'] as int?,
            ten: row['ten'] as int?,
            eleven: row['eleven'] as int?,
            twelve: row['twelve'] as int?,
            thirteen: row['thirteen'] as int?,
            fourteen: row['fourteen'] as int?,
            fifteen: row['fifteen'] as int?),
        arguments: [type]);
  }

  @override
  Future<int> insertLottery(Lottery question) {
    return _lotteryInsertionAdapter.insertAndReturnId(
        question, OnConflictStrategy.abort);
  }

  @override
  Future<int> updateLottery(Lottery lottery) {
    return _lotteryUpdateAdapter.updateAndReturnChangedRows(
        lottery, OnConflictStrategy.abort);
  }
}
