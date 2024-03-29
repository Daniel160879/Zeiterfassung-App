import 'package:flutter/material.dart';

const myHomeButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(175, 60)),
  backgroundColor: MaterialStatePropertyAll(
    Color.fromARGB(255, 80, 73, 72),
  ),
);

const myWorkingSpaceButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(175, 60)),
  backgroundColor: MaterialStatePropertyAll(
    Color.fromARGB(255, 80, 73, 72),
  ),
);

const myProjectButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(200, 100)),
  backgroundColor: MaterialStatePropertyAll(
    Color.fromARGB(255, 80, 73, 72),
  ),
);

const myAppBarTextStyle = TextStyle(
  color: Color.fromARGB(255, 255, 255, 255),
  fontSize: 24,
  fontWeight: FontWeight.bold,
);

const myClockStyle = TextStyle(
  color: Color.fromARGB(255, 255, 255, 255),
  fontSize: 45,
  fontWeight: FontWeight.bold,
);

const myTextStyle = TextStyle(
  color: Color.fromARGB(255, 255, 255, 255),
  fontSize: 16,
  fontWeight: FontWeight.bold,
);

const myBttnTextStyle = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255), fontSize: 24, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

const myHeadBttnTextStyle = TextStyle(
    color: Color.fromARGB(255, 255, 255, 255), fontSize: 30, fontWeight: FontWeight.bold, fontStyle: FontStyle.italic);

const myAppBar = AppBarTheme(
  backgroundColor: Color.fromARGB(255, 80, 73, 72),
  centerTitle: true,
  titleTextStyle: myAppBarTextStyle,
);
