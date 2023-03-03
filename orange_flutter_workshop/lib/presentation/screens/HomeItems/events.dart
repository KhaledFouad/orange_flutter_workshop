import 'package:flutter/material.dart';
import 'package:orange_flutter_workshop/data/models/sampleEvents.dart';
import 'package:orange_flutter_workshop/presentation/widgets/cutom_appbar.dart';
import 'package:syncfusion_flutter_calendar/calendar.dart';

class Events extends StatelessWidget {
  const Events({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: const PreferredSize(
            preferredSize: Size.fromHeight(80),
            child: CustomAppBar(title: "Events")),
        body: SfCalendar(
          view: CalendarView.month,
          dataSource: MeetingDataSource(_getDataSource()),
          monthViewSettings: const MonthViewSettings(
              appointmentDisplayMode: MonthAppointmentDisplayMode.appointment),
        ));
  }

  List<sampleEvents> _getDataSource() {
    final List<sampleEvents> meetings = <sampleEvents>[];
    final DateTime today = DateTime.now();
    final DateTime startTime = DateTime(today.year, today.month, today.day, 9);
    final DateTime endTime = startTime.add(const Duration(hours: 2));
    meetings.add(
        sampleEvents('Conference', startTime, endTime, Colors.orange, false));
    return meetings;
  }
}

class MeetingDataSource extends CalendarDataSource {
  MeetingDataSource(List<sampleEvents> source) {
    appointments = source;
  }

  @override
  DateTime getStartTime(int index) {
    return _getMeetingData(index).from;
  }

  @override
  DateTime getEndTime(int index) {
    return _getMeetingData(index).to;
  }

  @override
  String getSubject(int index) {
    return _getMeetingData(index).eventName;
  }

  @override
  Color getColor(int index) {
    return _getMeetingData(index).background;
  }

  @override
  bool isAllDay(int index) {
    return _getMeetingData(index).isAllDay;
  }

  sampleEvents _getMeetingData(int index) {
    final dynamic meeting = appointments![index];
    late final sampleEvents meetingData;
    if (meeting is sampleEvents) {
      meetingData = meeting;
    }
    return meetingData;
  }
}
