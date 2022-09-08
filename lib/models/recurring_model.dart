class RecurringModel {
  final int? id;
  final String? startAt;
  final String? endAt;
  final bool? isAvailable;

  RecurringModel({
    this.id,
    this.startAt,
    this.endAt,
    this.isAvailable,
  });

  factory RecurringModel.fromJson(Map<String, dynamic> responseData) {
    return RecurringModel(
      id: responseData['id'],
      startAt: responseData['start_at'],
      endAt: responseData['end_at'],
      isAvailable: responseData['is_available'],
     
      
    );
  }
}
