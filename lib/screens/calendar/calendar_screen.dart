import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/decoration/style/decoration.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/Data/holiday_data.dart';
import 'package:meine_zeiterfassungs_app/screens/calendar/decoration/calendar_deco.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../decoration/theme/theme.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  final TextEditingController _urlaubTextController = TextEditingController(text: '');
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  DateTime? _rangeStart;
  DateTime? _rangeEnd;
  Map<DateTime, List<Holidays>> urlaub = {};

  late ValueNotifier<List<Holidays>> _selectedUrlaub;

  @override
  void initState() {
    super.initState();
    _selectedDay = _focusedDay;
    _selectedUrlaub = ValueNotifier(_getUrlaubForDay(_selectedDay!));
  }

  @override
  void dispose() {
    super.dispose();
  }

  void onDaySelected(DateTime selectedDay, DateTime focusedDay) {
    if (!isSameDay(_selectedDay, selectedDay)) {
      setState(() {
        _selectedDay = selectedDay;
        _focusedDay = focusedDay;
        _selectedUrlaub.value = _getUrlaubForDay(selectedDay);
      });
    }
  }

  void onWeekSelected(DateTime? start, DateTime? end, DateTime focusedDay) {
    setState(() {
      _selectedDay = null;
      _focusedDay = focusedDay;
      _rangeStart = start;
      _rangeEnd = end;
    });
  }

  List<Holidays> _getUrlaubForDay(DateTime day) {
    return urlaub[day] ?? [];
  }

  List<Holidays> _getHollidaysForWeek(DateTime? focusedDay, DateTime? start, DateTime? end, DateTime? week) {
    return urlaub[week] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'Kalender',
          style: myAppBarTextStyle,
        ),
      ),
      body: Container(
        decoration: myBoxdeco,
        child: Column(
          children: [
            TableCalendar(
              rangeSelectionMode: RangeSelectionMode.toggledOn,
              onRangeSelected: onWeekSelected,
              rangeStartDay: _rangeStart,
              rangeEndDay: _rangeEnd,
              headerStyle: myCalendarHeaderStyle,
              daysOfWeekStyle: const DaysOfWeekStyle(
                weekendStyle: TextStyle(color: Color.fromARGB(155, 155, 155, 155)),
                weekdayStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                decoration: BoxDecoration(
                  color: Color.fromARGB(155, 80, 73, 72),
                ),
              ),
              firstDay: DateTime.utc(2010, 1, 1),
              lastDay: DateTime.utc(2040, 1, 1),
              focusedDay: DateTime.now(),
              selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
              startingDayOfWeek: StartingDayOfWeek.monday,
              onDaySelected: onDaySelected,
              eventLoader: _getUrlaubForDay,
              calendarStyle: myCalendarStyle,
            ),
            Container(
              height: 35,
              width: MediaQuery.of(context).size.width,
              decoration: const BoxDecoration(
                color: Color.fromARGB(155, 80, 73, 72),
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Expanded(
              child: ValueListenableBuilder<List<Holidays>>(
                valueListenable: _selectedUrlaub,
                builder: (context, value, _) {
                  return ListView.builder(
                    itemCount: value.length,
                    itemBuilder: (context, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: const Color.fromARGB(255, 80, 73, 72),
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(25),
                        ),
                        child: ListTile(
                          onTap: () => (''),
                          title: Text(
                            _urlaubTextController.text,
                            style: const TextStyle(color: Colors.white),
                          ),
                        ),
                      );
                    },
                  );
                },
              ),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AlertDialog(
                  backgroundColor: const Color.fromARGB(255, 80, 73, 72),
                  scrollable: true,
                  title: const Text(
                    'Urlaub',
                    style: myBttnTextStyle,
                  ),
                  content: Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      cursorColor: Colors.brown,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(
                            Radius.circular(25),
                          ),
                        ),
                      ),
                      controller: _urlaubTextController,
                      autofocus: true,
                    ),
                  ),
                  actions: [
                    ElevatedButton(
                      style: const ButtonStyle(
                        alignment: Alignment.center,
                        backgroundColor: WidgetStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                        urlaub.addAll({
                          _selectedDay!: [Holidays(holidaysId: '', day: _urlaubTextController.text)]
                        });
                        Navigator.of(context).pop();
                        _selectedUrlaub.value = _getUrlaubForDay(_selectedDay!);
                      },
                      child: const Text(
                        'Urlaubs Antrag',
                        style: myTextStyle,
                      ),
                    ),
                  ],
                );
              });
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
        ),
      ),
    );
  }
}
