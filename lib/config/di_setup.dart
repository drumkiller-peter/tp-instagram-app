import 'package:get_it/get_it.dart';
import 'package:tp_instagram_app/data/database/app_database.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<MyDatabase>(MyDatabase());
}
