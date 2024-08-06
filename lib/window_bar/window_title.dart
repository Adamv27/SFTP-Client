import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:sftp_client/app_theme.dart';

class WindowTitle extends StatelessWidget {
  const WindowTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 10),
      height: AppTheme.windowBarHeight,
      child: MoveWindow(
        child: const Text('SFTP Client'),
      ),
    );
  }
}
