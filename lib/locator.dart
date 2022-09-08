import 'package:bulldozer_test_technique_flutter/services/database.dart';
import 'package:bulldozer_test_technique_flutter/viewmodels/shifts_view_model.dart';
import 'package:get_it/get_it.dart';

GetIt? locator = GetIt.instance;

void setupLocator() {
  locator!.registerLazySingleton(() => DatabaseServices());
  locator!.registerLazySingleton(() => ShiftsViewModel());
}
