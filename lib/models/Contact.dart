import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

//WidgetsFlutterBinding.ensureInitialized();
/*
final database = openDatabase(
  // Set the path to the database. Note: Using the `join` function from the
  // `path` package is best practice to ensure the path is correctly
  // constructed for each platform.
  //join(await getDatabasesPath(), 'doggie_database.db'),
  // When the database is first created, create a table to store dogs.
  onCreate: (db, version) {
    // Run the CREATE TABLE statement on the database.
    return db.execute(
      'CREATE TABLE dogs(id INTEGER PRIMARY KEY, name TEXT, age INTEGER)',
    );
  },
  // Set the version. This executes the onCreate function and provides a
  // path to perform database upgrades and downgrades.
  version: 1,
);
*/
class Contact {
  final int id;
  String name;
  String address;

  Contact({
    required this.id, 
    required this.name, 
    required this.address 
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'address': address,
    };
  }

  @override
  String toString() {
    return 'Dog{id: $id, name: $name, age: $address}';
  }

}
/*8
Future<void> insertDog(Contact contact) async {
  // Get a reference to the database.
  //final db = await database;

  // Insert the Dog into the correct table. You might also specify the
  // `conflictAlgorithm` to use in case the same dog is inserted twice.
  //
  // In this case, replace any previous data.
  /*await db.insert(
    'dogs',
    contact.toMap(),
    conflictAlgorithm: ConflictAlgorithm.replace,
  );*/
}*/