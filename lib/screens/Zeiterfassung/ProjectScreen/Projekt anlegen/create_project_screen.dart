import 'package:flutter/material.dart';
import 'package:meine_zeiterfassungs_app/const/theme/theme.dart';

class CreateProjectScreen extends StatelessWidget {
  const CreateProjectScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 80, 73, 72),
        title: const Text(
          'Projekt erstellen',
          style: myAppBarTextStyle,
        ),
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(image: AssetImage('assets/background/background.png'), fit: BoxFit.cover),
        ),
        child: Center(
          child: Column(
            children: [
              const SizedBox(
                height: 75,
              ),
              Container(
                height: 200,
                width: 300,
                color: const Color.fromARGB(255, 80, 73, 72),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
