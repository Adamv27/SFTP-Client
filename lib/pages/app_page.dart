import 'package:flutter/material.dart';
import 'package:sftp_client/window_bar/window_bar.dart';

class AppPage extends StatelessWidget {
  const AppPage({super.key, required this.pageContent});
  final Widget pageContent;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const WindowBar(),
          Expanded(
            child: Container(
              padding: const EdgeInsets.all(16),
              color: Theme.of(context).colorScheme.primaryContainer,
              width: double.infinity,
              child: pageContent,
            ),
          ),
        ],
      ),
    );
  }
}
