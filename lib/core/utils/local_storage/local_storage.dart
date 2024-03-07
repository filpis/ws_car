import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:ws_car/modules/home/infra/car_model.dart';

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
        name TEXT,
        age INTEGER
      )
      ''');
  }

  Future<int> saveBuy(CarModel car) async {
    var dbClient = await db;
    int res = await dbClient.insert("Buy", car.toJson());
    return res;
  }

  Future<List<CarModel>> getBuy() async {
    var dbClient = await db;
    List<Map<String, dynamic>> list =
        await dbClient.rawQuery('SELECT * FROM Buy');
    List<CarModel> people = [];
    for (int i = 0; i < list.length; i++) {
      people.add(CarModel.fromJson(list[i]));
    }
    return people;
  }
}
