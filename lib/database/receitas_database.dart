import 'dart:io';

import 'package:cooking_agenda/models/receitas_model.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class RecipeDatabase {
  RecipeDatabase._privateConstructor();
  static final RecipeDatabase instance = RecipeDatabase._privateConstructor();

  static Database? _database;
  Future<Database> get database async => _database ?? await _initDatabase();

  Future<Database> _initDatabase() async {
    Directory documentsirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsirectory.path, 'recipes.db');
    return await openDatabase(path, version: 1, onCreate: _onCreate);
  }

  Future _onCreate(Database db, int version) async {
    await db.execute('''
    CREATE TABLE recipes(
    idReceita INTERGER PRIMARY KEY,
    nomeReceita TEXT,
    ingredientes TEXT,
    modoPreparo TEXT)
  ''');
  }

  Future<List<ReceitasModel>> getReceitas() async {
    Database db = await instance.database;
    var recipes = await db.query('recipes', orderBy: 'nomeReceita');
    List<ReceitasModel> recipeList = recipes.isNotEmpty
        ? recipes.map((elemnet) => ReceitasModel.fromMap(elemnet)).toList()
        : [];
    return recipeList;
  }

  Future<int> add(ReceitasModel receita) async {
    Database db = await instance.database;
    return await db.insert('recipes', receita.toMap());
  }

  Future<int> remove(int id) async {
    Database db = await instance.database;
    return await db.delete('recipe', where: 'idReceita = ?', whereArgs: [id]);
  }

  Future<int> update(ReceitasModel receita) async {
    Database db = await instance.database;
    return await db.update('recipes', receita.toMap(),
        where: 'idReceita = ?', whereArgs: [receita.idReceita]);
  }
}
