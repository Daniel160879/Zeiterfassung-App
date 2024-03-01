// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'dart:ui';

class WorkPlace {
  final String title;
  final Color color;
  WorkPlace({
    required this.title,
    required this.color,
  });

  WorkPlace copyWith({
    String? title,
    Color? color,
  }) {
    return WorkPlace(
      title: title ?? this.title,
      color: color ?? this.color,
    );
  }
}
