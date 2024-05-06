import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/decoration/theme/theme.dart';
import 'package:table_calendar/table_calendar.dart';

const myCalendarStyle = CalendarStyle(
  todayTextStyle: TextStyle(color: Color.fromARGB(255, 235, 1, 1)),
  weekendTextStyle: myTextStyle,
  rowDecoration: BoxDecoration(color: Color.fromARGB(255, 80, 73, 72)),
  weekNumberTextStyle: myTextStyle,
  markerDecoration: BoxDecoration(color: Colors.amber),
  weekendDecoration: BoxDecoration(color: Color.fromARGB(255, 90, 93, 82)),
  defaultTextStyle: TextStyle(color: Color.fromARGB(255, 218, 218, 216)),
  outsideDaysVisible: false,
);

const myCalendarHeaderStyle = HeaderStyle(
  titleCentered: true,
  formatButtonTextStyle: TextStyle(color: Colors.indigoAccent),
  formatButtonDecoration: BoxDecoration(color: Colors.deepOrange),
  titleTextStyle: TextStyle(color: Colors.yellow, fontWeight: FontWeight.bold, fontSize: 20),
  decoration: BoxDecoration(
    borderRadius: BorderRadius.vertical(
      top: Radius.circular(35),
    ),
    color: Color.fromARGB(255, 80, 73, 72),
  ),
);
