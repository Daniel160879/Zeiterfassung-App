import 'package:flutter/material.dart';

final myTextfieldDeco = InputDecoration(
    focusedBorder: const OutlineInputBorder(
      borderSide: BorderSide(
        color: Color.fromARGB(255, 80, 73, 72),
      ),
    ),
    labelText: 'Erstelle Projekt',
    labelStyle: const TextStyle(color: Colors.white),
    alignLabelWithHint: true,
    helperStyle: const TextStyle(color: Colors.white54),
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
    floatingLabelAlignment: FloatingLabelAlignment.center);
