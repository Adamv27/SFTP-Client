import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:sftp_client/app_theme.dart';

class WindowButtons extends StatefulWidget {
  const WindowButtons({super.key});

  @override
  State<WindowButtons> createState() => _WindowButtonsState();
}

class _WindowButtonsState extends State<WindowButtons> {
  void maximizeOrRestore() {
    setState(() {
      appWindow.maximizeOrRestore();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        MinimizeWindowButton(colors: AppTheme.buttonColors),
        appWindow.isMaximized
            ? RestoreWindowButton(
                colors: AppTheme.buttonColors,
                onPressed: maximizeOrRestore,
              )
            : MaximizeWindowButton(
                colors: AppTheme.buttonColors,
                onPressed: maximizeOrRestore,
              ),
        CloseWindowButton(colors: AppTheme.closeButtonColors),
      ],
    );
  }
}
