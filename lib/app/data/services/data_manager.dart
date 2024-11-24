import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import '../models/contact_model.dart';

class DataManager {
  static final DataManager instance = DataManager._init();
  static Database? _database;

  DataManager._init();

  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDB('contacts.db');
    return _database!;
  }

  Future<Database> _initDB(String filePath) async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, filePath);

    return await openDatabase(path, version: 1, onCreate: _createDB);
  }

  Future _createDB(Database db, int version) async {
    const idType = 'INTEGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''
    CREATE TABLE contacts (
      id $idType,
      name $textType,
      phoneNumber $textType,
      email $textType,
      company $textType,
      image TEXT NULL
    )
    ''');
  }

  Future<ContactModel> create(ContactModel contact) async {
    final db = await instance.database;
    final id = await db.insert('contacts', contact.toMap());
    return contact.copyWith(id: id);
  }

  Future<ContactModel?> readContact(int id) async {
    final db = await instance.database;

    final maps = await db.query(
      'contacts',
      columns: ['id', 'name', 'phoneNumber', 'email', 'company', 'image'],
      where: 'id = ?',
      whereArgs: [id],
    );

    if (maps.isNotEmpty) {
      return ContactModel.fromMap(maps.first);
    } else {
      return null;
    }
  }

  Future<List<ContactModel>> readAllContacts() async {
    final db = await instance.database;

    final result = await db.query('contacts');

    return result.map((json) => ContactModel.fromMap(json)).toList();
  }

  Future<int> update(ContactModel contact) async {
    final db = await instance.database;

    return db.update(
      'contacts',
      contact.toMap(),
      where: 'id = ?',
      whereArgs: [contact.id],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;

    return await db.delete(
      'contacts',
      where: 'id = ?',
      whereArgs: [id],
    );
  }

  Future close() async {
    final db = await instance.database;

    db.close();
  }
}
