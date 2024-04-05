import 'package:flutter/material.dart';

final myEmailFieldDeco = InputDecoration(
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
);

final myPasswordFieldDeco = InputDecoration(
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
);
