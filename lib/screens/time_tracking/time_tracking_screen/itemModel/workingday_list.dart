import 'package:flutter/material.dart';

class TimeList extends StatelessWidget {
  const TimeList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 300,
        width: 350,
        decoration:
            BoxDecoration(borderRadius: BorderRadius.circular(30), color: const Color.fromARGB(255, 80, 73, 72)),
        child: ListView.builder(
            itemCount: 4,
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              return const ListTile(
                contentPadding: EdgeInsets.all(8),
                leading: Text(
                  'data',
                  style: TextStyle(color: Colors.white),
                ),
                horizontalTitleGap: BorderSide.strokeAlignCenter,
                focusColor: Colors.amber,
                leadingAndTrailingTextStyle: TextStyle(color: Colors.blue),
              );
            }));
  }
}
