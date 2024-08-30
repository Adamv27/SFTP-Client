import 'package:flutter/material.dart';

class ToolBar extends StatelessWidget {
  const ToolBar({
    super.key,
    required this.workingDirectory,
    required this.onBackButton,
  });

  final String workingDirectory;
  final VoidCallback onBackButton;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      padding: const EdgeInsets.all(4),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 35,
            height: 35,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(colorScheme.onSecondaryContainer),
                padding: const WidgetStatePropertyAll(EdgeInsets.all(0.0)),
              ),
              onPressed: onBackButton,
              child: const Icon(
                Icons.arrow_back,
              ),
            ),
          ),
          const SizedBox(width: 8),
          Container(
            width: 200,
            padding: const EdgeInsets.all(7),
            decoration: BoxDecoration(
              color: colorScheme.onSecondaryContainer,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(
              workingDirectory,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 8),
          SizedBox(
            width: 35,
            height: 35,
            child: ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStatePropertyAll(colorScheme.onSecondaryContainer),
                padding: const WidgetStatePropertyAll(EdgeInsets.all(0.0)),
              ),
              onPressed: () {},
              child: const Icon(
                Icons.grid_view,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
