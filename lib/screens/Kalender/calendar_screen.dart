import 'package:flutter/material.dart';

import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';
import 'package:meine_zeiterfassungs_app/screens/Kalender/Data/calendar_data.dart';
import 'package:table_calendar/table_calendar.dart';

class CalendarScreen extends StatefulWidget {
  const CalendarScreen({super.key});

  @override
  State<CalendarScreen> createState() => _CalendarScreenState();
}

class _CalendarScreenState extends State<CalendarScreen> {
  CalendarFormat _calendarFormat = CalendarFormat.month;
  DateTime _focusedDay = DateTime.now();
  DateTime? _selectedDay;
  Map<DateTime, List<Urlaub>> urlaub = {};
  final TextEditingController _urlaubTextController = TextEditingController(text: '');
  late ValueNotifier<List<Urlaub>> _selectedUrlaub;

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

  List<Urlaub> _getUrlaubForDay(DateTime day) {
    return urlaub[day] ?? [];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'Kalender Screen',
          style: myTextStyle,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background/background.png'), fit: BoxFit.cover),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TableCalendar(
                headerStyle: const HeaderStyle(
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
                ),
                daysOfWeekStyle: const DaysOfWeekStyle(
                  weekendStyle: TextStyle(color: Color.fromARGB(155, 155, 155, 155)),
                  weekdayStyle: TextStyle(color: Color.fromARGB(255, 255, 255, 255)),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 80, 73, 72),
                  ),
                ),
                firstDay: DateTime.utc(2010, 1, 1),
                lastDay: DateTime.utc(2040, 1, 1),
                focusedDay: DateTime.now(),
                selectedDayPredicate: (day) => isSameDay(_selectedDay, day),
                startingDayOfWeek: StartingDayOfWeek.monday,
                onDaySelected: onDaySelected,
                eventLoader: _getUrlaubForDay,
                calendarStyle: const CalendarStyle(
                  todayTextStyle: TextStyle(color: Color.fromARGB(255, 235, 1, 1)),
                  weekendTextStyle: myTextStyle,
                  rowDecoration: BoxDecoration(color: Color.fromARGB(255, 80, 73, 72)),
                  weekNumberTextStyle: myTextStyle,
                  markerDecoration: BoxDecoration(color: Colors.amber),
                  weekendDecoration: BoxDecoration(color: Color.fromARGB(255, 90, 93, 82)),
                  defaultTextStyle: TextStyle(color: Color.fromARGB(255, 218, 218, 216)),
                  outsideDaysVisible: false,
                ),
                onFormatChanged: (format) {
                  if (_calendarFormat != format) {
                    setState(() {
                      _calendarFormat = format;
                    });
                  }
                },
                onPageChanged: (focusedDay) {
                  _focusedDay = focusedDay;
                },
              ),
              Container(
                height: 25,
                width: 380,
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 80, 73, 72),
                  borderRadius: BorderRadius.vertical(
                    bottom: Radius.circular(25),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              Expanded(
                child: ValueListenableBuilder<List<Urlaub>>(
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
                        backgroundColor: MaterialStatePropertyAll(Colors.black),
                      ),
                      onPressed: () {
                        urlaub.addAll({
                          _selectedDay!: [Urlaub(_urlaubTextController.text)]
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
