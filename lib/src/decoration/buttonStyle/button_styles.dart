import 'package:flutter/material.dart';

const myHomeButtonStyle = ButtonStyle(
  fixedSize: WidgetStatePropertyAll(Size(220, 60)),
  backgroundColor: WidgetStatePropertyAll(
    Color.fromARGB(255, 80, 73, 72),
  ),
);

const myCreateButtonStyle = ButtonStyle(
  shape: WidgetStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
  fixedSize: WidgetStatePropertyAll(Size(270, 60)),
  backgroundColor: WidgetStatePropertyAll(
    Color.fromARGB(255, 80, 73, 72),
  ),
);

const myWorkingSpaceButtonStyle = ButtonStyle(
  fixedSize: WidgetStatePropertyAll(Size(175, 60)),
  backgroundColor: WidgetStatePropertyAll(
    Color.fromARGB(255, 80, 73, 72),
  ),
);

const myProjectButtonStyle = ButtonStyle(
  fixedSize: WidgetStatePropertyAll(Size(200, 100)),
  backgroundColor: WidgetStatePropertyAll(
    Color.fromARGB(255, 80, 73, 72),
  ),
);
