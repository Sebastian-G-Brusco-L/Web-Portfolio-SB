import 'package:flutter/material.dart';

final List<GlobalKey> navBarKeys = List.generate(
  5,
  (index) => GlobalKey(),
); //globalkeys para cada seccion

void scrollToSection(GlobalKey key) {
  final context = key.currentContext;
  if (context != null) {
    Scrollable.ensureVisible(context,
        duration: const Duration(seconds: 1), curve: Curves.easeInOut);
  }
}
