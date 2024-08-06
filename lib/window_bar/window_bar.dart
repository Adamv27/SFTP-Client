import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:sftp_client/window_bar/window_buttons.dart';

class WindowBar extends StatelessWidget {
  const WindowBar({super.key});

  @override
  Widget build(BuildContext context) {
    return WindowTitleBarBox(
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Row(
          children: [
            Expanded(child: MoveWindow()),
            const WindowButtons(),
          ],
        ),
      ),
    );
  }
}
