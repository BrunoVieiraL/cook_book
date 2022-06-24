import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

import '../models/receitas_model.dart';

class RecipeDatabase {
  static final RecipeDatabase instance = RecipeDatabase._init();
  static Database? _database;
  RecipeDatabase._init();

  Future<Database> get database async {
    if (_database != null) {
      return _database!;
    } else {
      _database = await _initDatabase('receitas_databas.db');
      return _database!;
    }
  }

  Future<Database> _initDatabase(String filepath) async {
    final databasePath = await getDatabasesPath();
    final path = join(databasePath, filepath);
    return await openDatabase(path, version: 1, onCreate: _creatDataBase);
  }

  Future _creatDataBase(Database db, int version) async {
    const idReceitaType = 'INTERGER PRIMARY KEY AUTOINCREMENT';
    const textType = 'TEXT NOT NULL';

    await db.execute('''CREATE TABLE $tableRecipes (
          ${RecipeFields.idReceita}$idReceitaType,
          ${RecipeFields.nomeReceita}$textType,
          ${RecipeFields.ingredientes}$textType,
          ${RecipeFields.modoPreparo}$textType,
        )''');
  }

  Future close() async {
    final db = await instance.database;
    db.close();
  }

  Future<ReceitasModel> create(ReceitasModel receitasModel) async {
    final db = await instance.database;
    final id = await db.insert(
      tableRecipes,
      receitasModel.toJson(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
    return receitasModel.copy(idReceita: id);
  }

  Future<ReceitasModel> readRecipe(int id) async {
    final db = await instance.database;
    final maps = await db.query(
      tableRecipes,
      columns: RecipeFields.values,
      where: '${RecipeFields.idReceita} = ?',
      whereArgs: [id],
    );
    if (maps.isNotEmpty) {
      return ReceitasModel.fromJson(maps.first);
    } else {
      throw Exception('ID $id not found');
    }
  }

  Future<List<ReceitasModel>> readAllRecipes() async {
    final db = await instance.database;
    final result = await db.query(tableRecipes);
    return result.map((json) => ReceitasModel.fromJson(json)).toList();
  }

  Future<int> update(ReceitasModel receitasModel) async {
    final db = await instance.database;
    return db.update(
      tableRecipes,
      receitasModel.toJson(),
      where: '${RecipeFields.idReceita} = ?',
      whereArgs: [receitasModel.idReceita],
    );
  }

  Future<int> delete(int id) async {
    final db = await instance.database;
    return await db.delete(
      tableRecipes,
      where: '${RecipeFields.idReceita} = ?',
      whereArgs: [id],
    );
  }
}
