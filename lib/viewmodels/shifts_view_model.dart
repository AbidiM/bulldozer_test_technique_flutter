import 'package:bulldozer_test_technique_flutter/locator.dart';
import 'package:bulldozer_test_technique_flutter/models/offered_shifts_model.dart';
import 'package:bulldozer_test_technique_flutter/services/database.dart';
import 'package:flutter/material.dart';

class ShiftsViewModel extends ChangeNotifier {
  final DatabaseServices _databaseServices = locator!<DatabaseServices>();

  List<OfferedShiftsModel> shifts = <OfferedShiftsModel>[];

  OfferedShiftsModel? _shift;
  OfferedShiftsModel get shift => _shift!;

  setUser(OfferedShiftsModel shift) {
    _shift = shift;
  }

  Future<List<OfferedShiftsModel>> fetchShifts() async {
    var doc = await _databaseServices.readJson();
    shifts.clear();
    doc!.forEach((element) {
      shifts.add(OfferedShiftsModel.fromJson(element));
    });
    return shifts;
  }
}
