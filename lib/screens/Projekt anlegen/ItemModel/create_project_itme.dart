import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/screens/Projekt%20anlegen/Data/data.dart';

class CreateProjectItem extends StatelessWidget {
  const CreateProjectItem({super.key, required this.createProject});

  final CreateProject createProject;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      width: 350,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(35),
        color: null,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Placeholder(
            color: Color.fromARGB(0, 80, 73, 72),
            child: Icon(
              Icons.child_care_rounded,
              color: Colors.white,
              size: 150,
            ),
          ),
          Container(
            height: 150,
            width: 150,
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 80, 73, 72),
              borderRadius: BorderRadius.circular(12),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      height: 20,
                      width: 125,
                      color: Colors.red,
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
