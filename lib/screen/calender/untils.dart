import 'dart:collection';
import 'package:day_offf_app/screen/all_request/controller/AllRequestController.dart';
import 'package:get/get.dart';
import 'package:table_calendar/table_calendar.dart';

AllRequestController allRequestController = Get.find();

class Event {
  String? name;
  String? avatar;
  String? startTime;
  String? endTime;
  String? status;

  Event(this.name, this.avatar, this.startTime, this.endTime, this.status);
}

/// Using a [LinkedHashMap] is highly recommended if you decide to use a map.
final kEvents = LinkedHashMap<DateTime, List<Event>>(
  equals: isSameDay,
  hashCode: getHashCode,
)..addAll(_kEventSource);

final _kEventSource = { for (var item in List.generate(50, (index) => index)) DateTime.utc(kFirstDay.year, kFirstDay.month) : List.generate(
        item % 4 + 3, (index) => Event('Name$index', '', '', '', '')) }
  ..addAll({
    kToday: [],
  });

int getHashCode(DateTime key) {
  return key.day * 1000000 + key.month * 10000 + key.year;
}

/// Returns a list of [DateTime] objects from [first] to [last], inclusive.
List<DateTime> daysInRange(DateTime first, DateTime last) {
  final dayCount = last.difference(first).inDays + 1;
  return List.generate(
    dayCount,
    (index) => DateTime.utc(first.year, first.month, first.day + index),
  );
}

final kToday = DateTime.now();
final kFirstDay = DateTime(kToday.year, kToday.month - 3, kToday.day);
final kLastDay = DateTime(kToday.year, kToday.month + 3, kToday.day);
