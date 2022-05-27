class DayOff {
  DayOff({
    required this.isMorning,
    required this.isMultipleDay,
    required this.fromDay,
    required this.toDay,
    required this.reason,
  });
  late final bool isMorning;
  late final bool isMultipleDay;
  late final DateTime fromDay;
  late final DateTime toDay;
  late final String reason;

  DayOff.fromJson(Map<String, dynamic> json) {
    isMorning = json['isMorning'];
    isMultipleDay = json['isMultipleDay'];
    fromDay = json['fromDay'];
    toDay = json['toDay'];
    reason = json['reason'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['isMorning'] = isMorning;
    _data['isMultipleDay'] = isMultipleDay;
    _data['fromDay'] = fromDay.toIso8601String();
    _data['toDay'] = toDay.toIso8601String();
    _data['reason'] = reason;
    return _data;
  }
}
