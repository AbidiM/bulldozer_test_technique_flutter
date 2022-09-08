import 'package:bulldozer_test_technique_flutter/models/recurring_model.dart';

class OfferedShiftsModel {
  final int? id;
  final String? status;
  final String? startAt;
  final String? endAt;
  final String? postName;
  final int? postId;
  final bool? startSoon;
  final RecurringModel? recurring;
  final String? company;
  final String? buyPrice;
  final int? bonus;
  final double? latitude;
  final double? longitude;

  OfferedShiftsModel({
    this.id,
    this.status,
    this.startAt,
    this.endAt,
    this.postName,
    this.postId,
    this.startSoon,
    this.recurring,
    this.company,
    this.buyPrice,
    this.bonus,
    this.latitude,
    this.longitude,
  });

  factory OfferedShiftsModel.fromJson(Map<String, dynamic> responseData) {
    return OfferedShiftsModel(
      id: responseData['id'] ?? 0,
      status: responseData['status'] ?? "",
      startAt: responseData['start_at'] ?? "",
      endAt: responseData['end_at'] ?? "",
      postName: responseData['post_name'] ?? "",
      postId: responseData['post_id'] ?? 0,
      startSoon: responseData['start_soon'] ?? false,
      recurring:
      responseData['recurring'] == null
          ? null
          : RecurringModel.fromJson(responseData['recurring'])
           ,
      company: responseData['company'] ?? "",
      buyPrice: responseData['buy_price'] ?? "",
      bonus: responseData['bonus'] ?? 0,
      latitude: responseData['latitude'] ?? 0,
      longitude: responseData['longitude'] ?? 0,
    );
  }
}
