// // To open the database, add these imports to the existing file defining the
// // database class. They are used to open the database.
// import 'dart:developer';
// import 'dart:io';

// import 'package:drift/drift.dart';
// import 'package:drift/native.dart';
// import 'package:path/path.dart' as p;
// import 'package:path_provider/path_provider.dart';
// import 'package:tp_instagram_app/data/database/home/home_table.dart';

// part 'app_database.g.dart';

// @DriftDatabase(tables: [Home])
// class MyDatabase extends _$MyDatabase {
//   // we tell the database where to store the data with this constructor
//   MyDatabase() : super(_openConnection());

//   // you should bump this number whenever you change or add a table definition.
//   // Migrations are covered later in the documentation.
//   @override
//   int get schemaVersion => 4;

//   @override
//   MigrationStrategy get migration => MigrationStrategy(
//         onUpgrade: (migrator, from, to) async {
//           for (var table in allTables) {
//             await migrator.deleteTable(table.actualTableName);
//             await migrator.createTable(table);
//           }
//         },
//       );

//   Future deleteEverything() {
//     return transaction(() async {
//       for (final table in allTables) {
//         await delete(table).go();
//       }
//     });
//   }
// }

// LazyDatabase _openConnection() {
//   // the LazyDatabase util lets us find the right location for the file async.
//   return LazyDatabase(() async {
//     // put the database file, called db.sqlite here, into the documents folder
//     // for your app.
//     final dbFolder = await getApplicationDocumentsDirectory();
//     final file = File(p.join(dbFolder.path, 'db.sqlite'));
//     log(file.path.toString());
//     return NativeDatabase.createInBackground(file);
//   });
// }
