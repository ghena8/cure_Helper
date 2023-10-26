import 'package:CureHelper/models/medicineTask.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  static Database? _db;
  static final int _version = 1;
  static final String _tableName = "medicine task";

  static Future<void> initDb() async {
    if (_db != null) {
      return;
    }
    try {
      String _path = await getDatabasesPath() + 'medicine task.db';
      _db = await openDatabase(
        _path,
        version: _version,
        onCreate: (db, version) {
          print("creating a new one ");
          return db.execute(
              // Create a table
              "CREATE TABLE $_tableName(id INTEGER PRIMARY KEY, medicineName TEXT, price TEXT, isCompleted INTEGER, amountOfMedication TEXT, packagesNumber INTEGER, medicationDose TEXT, startDate TEXT, time TEXT, condition TEXT, color INTEGER, remind INTEGER, repeat TEXT,  )  ");
        },
      );
    } catch (e) {
      print(e);
    }
  }

  static Future<int> insert(medicineTask? task) async {
    print("insert function called");
    return await _db?.insert(_tableName, task!.toJson()) ?? 1;
  }

}
