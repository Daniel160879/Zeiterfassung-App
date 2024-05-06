import 'package:flutter/material.dart';

const myHomeButtonStyle = ButtonStyle(
  fixedSize: MaterialStatePropertyAll(Size(220, 60)),
  backgroundColor: MaterialStatePropertyAll(
    Color.fromARGB(255, 80, 73, 72),
  ),
);

const myCreateButtonStyle = ButtonStyle(
  shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15)))),
  fixedSize: MaterialStatePropertyAll(Size(270, 60)),
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
