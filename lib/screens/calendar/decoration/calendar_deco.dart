import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/decoration/theme/theme.dart';
import 'package:table_calendar/table_calendar.dart';

const myCalendarStyle = CalendarStyle(
  todayTextStyle: TextStyle(color: Color.fromARGB(255, 235, 1, 1)),
  weekendTextStyle: myTextStyle,
  rowDecoration: BoxDecoration(color: Color.fromARGB(155, 80, 73, 72)),
  weekNumberTextStyle: myTextStyle,
  markerDecoration: BoxDecoration(color: Colors.white),
  weekendDecoration: BoxDecoration(color: Color.fromARGB(155, 90, 93, 82)),
  defaultTextStyle: TextStyle(color: Color.fromARGB(255, 218, 218, 216)),
  outsideDaysVisible: false,
);

const myCalendarHeaderStyle = HeaderStyle(
  titleCentered: true,
  formatButtonTextStyle: TextStyle(color: Colors.indigoAccent),
  titleTextStyle: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20),
  decoration: BoxDecoration(
    color: Color.fromARGB(155, 80, 73, 72),
  ),
);
