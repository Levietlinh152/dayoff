import 'package:flutter/material.dart';


class PersonEvent {
  String? name;
  String? avatar;
  DateTime? startTime;
  DateTime? endTime;
  Color? color;
  String? status;

  PersonEvent(this.name, this.avatar, this.startTime, this.endTime, this.color,
      this.status);
}
