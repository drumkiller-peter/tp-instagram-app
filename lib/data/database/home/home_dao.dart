// import 'dart:developer';

// import 'package:drift/drift.dart';
// import 'package:tp_instagram_app/data/database/app_database.dart';
// import 'package:tp_instagram_app/data/database/home/home_table.dart';
// import 'package:tp_instagram_app/models/post/post_model.dart';

// part 'home_dao.g.dart';

// @DriftAccessor(tables: [Home])
// class HomeDao extends DatabaseAccessor<MyDatabase> with _$HomeDaoMixin {
//   // HomeDao(attachedDb) : super(attachedDb);
//   HomeDao(super.attachedDatabase);

//   Future<int> setHomeData(HomeCompanion homeCompanion) async {
//     return await into(home).insertOnConflictUpdate(homeCompanion);
//   }

//   Future<List<PostModel>> getHomeData() async {
//     try {
//       var response = await (select(home)
//           // ..where((tbl) => tbl.likeCount.isBiggerThanValue(20)))
//           )
//           .get();
//       return response.map((e) => PostModel.fromJson(e.toJson())).toList();
//     } catch (e) {
//       log("$e I am from getHomeData()");
//       rethrow;
//     }
//   }
// }
