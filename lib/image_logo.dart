import 'package:flutter/material.dart';

class MyLogo extends StatelessWidget {
  const MyLogo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 400,
      width: 400,
      decoration: const BoxDecoration(
        image: DecorationImage(image: AssetImage('assets/images/logo1.png'), fit: BoxFit.cover),
      ),
    );
  }
}
