import 'package:drift/drift.dart';
import 'package:tp_instagram_app/data/database/my_app_database.dart';
import 'package:tp_instagram_app/data/database/profile/profile_table.dart';
import 'package:tp_instagram_app/models/profile/profile_model.dart';

part 'profile_dao.g.dart';

@DriftAccessor(tables: [Profile])
class ProfileDao extends DatabaseAccessor<AppDatabase> with _$ProfileDaoMixin {
  ProfileDao(super.attachedDatabase);

  Future<int> setProfileData(ProfileCompanion profileCompanion) async {
    return await into(profile).insertOnConflictUpdate(profileCompanion);
  }

  Future<List<ProfileModel>> getProfileData() async {
    var response = await (select(profile)
          ..where((tbl) => tbl.id.isBiggerThanValue(20))
          ..where((tbl) => tbl.email.length.isSmallerThanValue(10)))
        .get();
    return response
        .map(
          (e) => ProfileModel.fromJson(
            e.toJson(),
          ),
        )
        .toList();
  }
}
