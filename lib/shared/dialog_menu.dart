import 'package:flutter/material.dart';

class DialogMenu extends StatelessWidget {
  static double maxWidth = 500;

  const DialogMenu({
    super.key,
    required this.menuContent,
  });

  final Widget menuContent;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Dialog(
      child: Container(
        constraints: BoxConstraints(
            minWidth: 400,
            maxWidth: DialogMenu.maxWidth,
            minHeight: 500,
            maxHeight: 700),
        decoration: BoxDecoration(
          color: colorScheme.primaryContainer,
          borderRadius: BorderRadius.circular(8),
        ),
        padding: const EdgeInsets.all(16),
        child: menuContent,
      ),
    );
  }
}
