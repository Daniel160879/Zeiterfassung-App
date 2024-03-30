import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/Mitarbeiter/Data/employers.dart';

class EmployersItemModel extends StatelessWidget {
  const EmployersItemModel({super.key, required this.mitarbeiter});

  final Mitarbeiter mitarbeiter;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                const Placeholder(
                  color: Colors.transparent,
                  child: Icon(
                    Icons.child_care,
                    color: Colors.white,
                    size: 100,
                  ),
                ),
                Container(
                  height: 100,
                  width: 200,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 80, 73, 72),
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 15,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: Text(mitarbeiter.firstName),
                      ),
                      Container(
                        height: 15,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: Text(mitarbeiter.lastName),
                      ),
                      Container(
                        height: 15,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: Text(
                          mitarbeiter.age,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ],
    );
  }
}
