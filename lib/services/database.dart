import 'dart:convert';

import 'package:flutter/services.dart';

class DatabaseServices {
  Future readJson() async {
    final String response =
        await rootBundle.loadString('assets/json/offered_shifts.json');
    final data = await json.decode(response);
    return data["data"];
  }
}
