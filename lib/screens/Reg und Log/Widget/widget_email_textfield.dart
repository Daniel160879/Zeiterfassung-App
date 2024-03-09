import 'package:flutter/material.dart';

class MyEmailTextField extends StatefulWidget {
  const MyEmailTextField({super.key});

  @override
  State<MyEmailTextField> createState() => _MyEmailState();
}

TextEditingController _emailController = TextEditingController(text: '');

class _MyEmailState extends State<MyEmailTextField> {
  @override
  void dispose() {
    super.dispose();
    _emailController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: _emailController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 80, 73, 72),
          ),
        ),
        prefixIcon: const Icon(Icons.password),
        hintText: 'Enter email adresse',
        hintStyle: const TextStyle(color: Colors.white),
        labelText: 'Enter email adresse',
        helperText: 'sonderzeichen,min.8 Zeichen und Zahlen',
        helperStyle: const TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.black),
          borderRadius: BorderRadius.circular(25),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.center,
      ),
    );
  }
}
