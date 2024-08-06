import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';

class WindowTitle extends StatelessWidget {
  const WindowTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        width: double.infinity,
        child: MoveWindow(),
      ),
    );
  }
}
