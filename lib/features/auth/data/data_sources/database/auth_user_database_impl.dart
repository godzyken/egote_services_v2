import 'dart:async';
import 'dart:developer' as developer;

import 'package:egote_services_v2/features/auth/data/data_sources/database/source_base.dart';
import 'package:egote_services_v2/features/auth/data/entities/users_entity.dart';
import 'package:path/path.dart' as path;
import 'package:sqflite/sqflite.dart';

class AuthUserDatabaseImpl implements SourceBase {
  static final AuthUserDatabaseImpl instance = AuthUserDatabaseImpl._init();
  static const _databaseName = 'auth_users_database';
  static const _tableName = 'auth_users_table';
  static const _databaseVersion = 1;
  static const _columnUserId = 'id';
  static Database? _database;
  static Completer<Database>? _initCompleter;

  AuthUserDatabaseImpl._init();

  Future<Database> get database async {
    Sqflite.setLockWarningInfo(
        duration: const Duration(seconds: 5), callback: close);

    _database ??= await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    if (_database != null) return _database!;
    try {
      var databasePath = await getDatabasesPath();
      String p = path.join(databasePath, _databaseName);
      return openDatabase(p,
          onConfigure: (db) => _onConfigure(db),
          onOpen: (db) => _onOpen(db),
          onCreate: (db, version) => _onCreate(db, version),
          version: _databaseVersion);
    } on Exception catch (e) {
      developer.log('database initialisation error : $e');
      return database;
    }
  }

  Future<Database> _ensureInitialized() async {
    if (_database != null) return _database!;
    if (_initCompleter != null) return await _initCompleter!.future;
    _initCompleter = Completer<Database>();
    final dtb = await _initDatabase();
    _database = dtb;
    _initCompleter?.complete(dtb);
    return dtb;
  }

  static void _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE IF NOT EXISTS $_tableName(
    $_columnUserId INTEGER PRIMARY KEY AUTOINCREMENT NOT NULL,
    )''');
  }

  static void _onConfigure(Database db) async {
    await db.execute("PRAGMA foreign_keys = ON");
    await db.rawQuery('PRAGMA journal_mode=WAL');
  }

  static void _onOpen(Database db) async {
    developer.log('database version: ${await db.getVersion()}');
  }

  @override
  Future close() async {
    final db = await _ensureInitialized();
    db.close();
  }

  @override
  Future<int> deleteAllUsers() async {
    final db = await _ensureInitialized();
    final res = await db.rawDelete(_tableName);
    developer.log('Delete All result: $res');
    return res;
  }

  @override
  Future<int> deleteUser(int id) async {
    final db = await _ensureInitialized();
    return await db.delete(
      _tableName,
      where: '$_columnUserId = ?',
      whereArgs: [id],
    );
  }

  @override
  Future<UserListEntity> getAllUsers() async {
    final db = await _ensureInitialized();
    return db.query(_tableName);
  }

  @override
  Future<UserEntity> insertUser(final UserEntity user) async {
    final db = await _ensureInitialized();
    late final UserEntity userEntity;
    await db.transaction((txn) async {
      final id = await txn.insert(_tableName, user,
          conflictAlgorithm: ConflictAlgorithm.replace);
      final results = await txn.query(
        _tableName,
        where: '$_columnUserId = ?',
        whereArgs: [id],
      );
      userEntity = results.first;
    });
    return userEntity;
  }

  @override
  Future<void> updateUser(UserEntity userEntity) async {
    final db = await _ensureInitialized();
    final int id = userEntity['id'];
    await db.update(
      _tableName,
      userEntity,
      where: '$_columnUserId= ?',
      whereArgs: [id],
    );
  }
}
