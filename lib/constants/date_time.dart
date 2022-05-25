import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'date_time_format_constant.dart';

class DateTimeUtilities {
  static DateTime parseToDate(String formattedString) {
    return DateTime.parse(formattedString);
  }

  static DateTime parseUtc(String formattedString) {
    if (formattedString.isEmpty) {
      return DateTime.now();
    }
    return DateTime.parse('${formattedString}Z');
  }

  static DateTime? parseBirthDayOrNull(String? birthDay) {
    if (birthDay == null) {
      return null;
    }
    return DateFormat(DateTimeFormatPatternConstants.pattern1).parse(birthDay);
  }

  static DateTime formatDate(String birthDay) {
    return DateFormat(DateTimeFormatPatternConstants.pattern1).parse(birthDay);
  }

  static String formatBirthDay(DateTime birthDay) {
    return DateFormat(DateTimeFormatPatternConstants.pattern1).format(birthDay);
  }

  static String formatBirthDayPattern6(DateTime birthDay) {
    return DateFormat(DateTimeFormatPatternConstants.pattern6).format(birthDay);
  }

  static String formatBirthDayPattern7(DateTime birthDay) {
    return DateFormat(DateTimeFormatPatternConstants.pattern7).format(birthDay);
  }

  static String formatToDisplay(DateTime date) {
    return DateFormat(DateTimeFormatPatternConstants.pattern2).format(date);
  }

  static String formatToSendToBackEnd(DateTime date) {
    return DateFormat(DateTimeFormatPatternConstants.pattern1).format(date);
  }

  ///https://github.com/dart-lang/intl/issues/183
  static String formatToDisplayPattern3(DateTime date) {
    return '{DateFormat(DateTimeFormatPatternConstants.pattern5).format(date).toLowerCase()}・DateFormat(DateTimeFormatPatternConstants.pattern5).format(date).toLowerCase()・{formatToDisplayPattern4(date)}';
  }

  static String formatToDisplayPattern4(DateTime date) {
    return DateFormat(DateTimeFormatPatternConstants.pattern4).format(date);
  }

  static String formatToDisplayPattern5(DateTime date) {
    return DateFormat(DateTimeFormatPatternConstants.pattern5).format(date);
  }

  static String formatHHMMSS(int seconds) {
    final Duration duration = Duration(seconds: seconds);
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    final String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    if (duration.inHours == 0) {
      return '$twoDigitMinutes:$twoDigitSeconds';
    }
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes:$twoDigitSeconds';
  }

  static DateTime parseUtcToTimeZone(String formattedString, int timeZone) {
    return DateTime(
      DateTime.parse(formattedString).year,
      DateTime.parse(formattedString).month,
      DateTime.parse(formattedString).day,
      DateTime.parse(formattedString).hour + timeZone,
    );
  }

  static String convertDurationToHourMinuteDisplay(Duration duration) {
    String twoDigits(int n) => n.toString().padLeft(2, '0');
    final String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    return '${twoDigits(duration.inHours)}:$twoDigitMinutes';
  }

  static DateTime parseStringTimestamp(String? stringTimeStamp) {
    if (stringTimeStamp == null) {
      return DateTime.now();
    }

    final int? timeStamp = int.tryParse(stringTimeStamp);

    return parseIntTimestamp(timeStamp);
  }

  static DateTime parseIntTimestamp(int? timeStamp) {
    if (timeStamp == null) {
      return DateTime.now();
    }
    return DateTime.fromMillisecondsSinceEpoch(timeStamp);
  }

  static int dateToTimestamp(DateTime dateTime) {
    return dateTime.millisecondsSinceEpoch;
  }

  static String formatTimeOfDay(TimeOfDay timeOfDay) {
    final String hourLabel = _addLeadingZeroIfNeeded(timeOfDay.hour);
    final String minuteLabel = _addLeadingZeroIfNeeded(timeOfDay.minute);
    return '$hourLabel:$minuteLabel';
  }

  static String _addLeadingZeroIfNeeded(int value) {
    if (value < 10) {
      return '0$value';
    }
    return value.toString();
  }

  /// check if the [compareDate] is today or not
  static bool isDateToday(DateTime compareDate) {
    final DateTime now = DateTime.now();
    return compareDate.year == now.year &&
        compareDate.month == now.month &&
        compareDate.day == now.day;
  }

  /// check if the [timeOfDay] is before now or not
  bool isTimeOfDayBeforeNow(TimeOfDay timeOfDay) {
    final DateTime now = DateTime.now();
    final DateTime compareDateTime = DateTime(
      now.year,
      now.month,
      now.day,
      timeOfDay.hour,
      timeOfDay.minute,
    );
    return compareDateTime.isBefore(now);
  }
}