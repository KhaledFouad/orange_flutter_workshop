import 'package:flutter/material.dart';

class sampleEvents {
  sampleEvents(
      this.eventName, this.from, this.to, this.background, this.isAllDay);
  String eventName;
  DateTime from;
  DateTime to;
  Color background;
  bool isAllDay;
}
