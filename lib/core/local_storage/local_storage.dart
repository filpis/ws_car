import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ws_car/modules/home/infra/models/saved_car_model.dart';

class LocalStorage {
  static final LocalStorage instance = LocalStorage.internal();

  factory LocalStorage() => instance;

  Database? _db;

  LocalStorage.internal();

  Future<Database> get db async {
    if (_db != null) return _db!;
    _db = await initDb();
    return _db!;
  }

  Future<Database> initDb() async {
    String databasesPath = await getDatabasesPath();
    String path = join(databasesPath, 'database.db');
    var db = await openDatabase(path, version: 1, onCreate: _onCreate);
    return db;
  }

  void _onCreate(Database db, int newVersion) async {
    await db.execute('''
    CREATE TABLE Buy
    (
      id INTEGER PRIMARY KEY,
      timestampCadastro INTEGER,
      modeloId INTEGER,
      ano INTEGER,
      combustivel TEXT,
      numPortas INTEGER,
      cor TEXT,
      nomeModelo TEXT,
      valor REAL,
      date INTEGER,
      email TEXT
    )
    ''');
  }

  Future<void> saveBuy(SaveBuyModel buys) async {
    var dbClient = await db;
    for (var car in buys.cars) {
      await dbClient.insert(
        "Buy",
        car.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    return;
  }

  Future<SaveBuyModel?> getBuy() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list =
        await dbClient.rawQuery('SELECT * FROM Buy');
    SaveBuyModel data = SaveBuyModel(cars: []);

    for (int i = 0; i < list.length; i++) {
      data.cars.add(SavedCarModel.fromJson(list[i]));
    }

    return data.cars.isNotEmpty ? data : null;
  }
}
