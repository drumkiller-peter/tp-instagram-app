import 'package:drift/drift.dart';

class Profile extends Table {
  IntColumn get id => integer()();
  TextColumn get email => text().nullable()();
  TextColumn get bio => text()();

  @JsonKey('follower_count')
  IntColumn get followerCount => integer()();

  @JsonKey('following')
  IntColumn get following => integer()();

  @override
  Set<Column>? get primaryKey => {id};
}
