import 'package:flutter/material.dart';

class LocalFileExplorer extends StatelessWidget {
  const LocalFileExplorer({super.key, required this.width});

  final double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8),
      color: Theme.of(context).colorScheme.secondaryContainer,
      width: width,
      child: Container(),
    );
  }
}
