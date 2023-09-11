import 'package:drift/drift.dart';

@DataClassName('MyHomeTable')
class Home extends Table {
  @JsonKey("id")
  IntColumn get id => integer().nullable()();

  @JsonKey("title")
  TextColumn get title => text().nullable()();

  @JsonKey("description")
  TextColumn get description => text().nullable()();

  // @JsonKey("date")
  // DateTimeColumn get date => dateTime().nullable()();

  @JsonKey("likeCount")
  IntColumn get likeCount => integer().nullable()();

  @JsonKey("imagePath")
  TextColumn get imagePath => text().nullable()();

  @override
  Set<Column>? get primaryKey => {id};
}
