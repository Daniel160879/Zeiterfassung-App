import 'package:flutter/material.dart';

class MyPasswordTextField extends StatefulWidget {
  const MyPasswordTextField({super.key});

  @override
  State<MyPasswordTextField> createState() => _MyTextFieldState();
}

TextEditingController _passwordController = TextEditingController(text: '');

class _MyTextFieldState extends State<MyPasswordTextField> {
  @override
  void dispose() {
    _passwordController.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      textAlignVertical: TextAlignVertical.center,
      controller: _passwordController,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 80, 73, 72),
          ),
        ),
        prefixIcon: const Icon(Icons.password),
        hintText: 'Enter Passwort',
        hintStyle: const TextStyle(color: Colors.white),
        labelText: 'Enter Passwort',
        helperText: 'sonderzeichen,min.8 Zeichen und Zahlen',
        helperStyle: const TextStyle(color: Colors.white54),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        floatingLabelAlignment: FloatingLabelAlignment.center,
      ),
    );
  }
}
