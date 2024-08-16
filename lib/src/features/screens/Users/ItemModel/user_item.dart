import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/src/features/screens/Users/data/user.dart';

class EmployersItemModel extends StatefulWidget {
  const EmployersItemModel({super.key, required this.user});

  final Users user;

  @override
  State<EmployersItemModel> createState() => _EmployersItemModelState();
}

class _EmployersItemModelState extends State<EmployersItemModel> {
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
                        child: Text(
                          widget.user.firstName,
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      Container(
                        height: 15,
                        width: 150,
                        decoration: const BoxDecoration(color: Colors.transparent),
                        child: Text(
                          widget.user.lastName,
                          style: const TextStyle(color: Colors.white),
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
