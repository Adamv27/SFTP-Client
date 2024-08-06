import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/app.dart';

void main() {
  appWindow.size = const Size(800, 600);
  runApp(const ProviderScope(child: App()));
  appWindow.show();

  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(800, 600);
    win.minSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "SFTP Client";

    win.show();
  });
}
