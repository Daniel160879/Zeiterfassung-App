import 'package:flutter/material.dart';

final myFirstNameFieldDeco = InputDecoration(
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 80, 73, 72),
    ),
  ),
  prefixIcon: const Icon(Icons.accessibility, color: Colors.white),
  hintText: 'Vorname',
  hintStyle: const TextStyle(color: Colors.white),
  labelText: 'Vorname',
  labelStyle: const TextStyle(color: Colors.white),
  helperText: 'min.8 Zeichen und Zahlen',
  helperStyle: const TextStyle(color: Colors.white54),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(25),
  ),
  floatingLabelAlignment: FloatingLabelAlignment.center,
);

final myLastNameFieldDeco = InputDecoration(
  focusedBorder: const OutlineInputBorder(
    borderSide: BorderSide(
      color: Color.fromARGB(255, 80, 73, 72),
    ),
  ),
  prefixIcon: const Icon(Icons.accessibility, color: Colors.white),
  hintText: 'Nachname',
  hintStyle: const TextStyle(color: Colors.white),
  labelText: 'Nachname',
  labelStyle: const TextStyle(color: Colors.white),
  helperText: 'min.8 Zeichen und Zahlen',
  helperStyle: const TextStyle(color: Colors.white54),
  border: OutlineInputBorder(
    borderSide: const BorderSide(color: Colors.black),
    borderRadius: BorderRadius.circular(25),
  ),
  floatingLabelAlignment: FloatingLabelAlignment.center,
);

final myEmailFieldDeco = InputDecoration(
  focusedBorder: const OutlineInputBorder(borderSide: BorderSide(color: Color.fromARGB(255, 80, 73, 72))),
  prefixIcon: const Icon(
    Icons.email,
    color: Colors.white,
  ),
  hintText: 'Email adresse',
  hintStyle: const TextStyle(color: Colors.white),
  labelText: 'Email adresse',
  labelStyle: const TextStyle(color: Colors.white),
  helperText: 'min.8 Zeichen und Zahlen',
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
  prefixIcon: const Icon(Icons.password, color: Colors.white),
  hintText: 'Enter Passwort',
  hintStyle: const TextStyle(color: Colors.white),
  labelText: 'Enter Passwort',
  labelStyle: const TextStyle(color: Colors.white),
  helperText: 'min.8 Zeichen und Zahlen',
  helperStyle: const TextStyle(color: Colors.white54),
  border: OutlineInputBorder(
    borderRadius: BorderRadius.circular(25),
  ),
  floatingLabelAlignment: FloatingLabelAlignment.center,
);
