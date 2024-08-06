import 'package:flutter/material.dart';
import 'package:sftp_client/window_bar/window_title.dart';

class NavMenu extends StatelessWidget {
  const NavMenu({super.key});
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      color: colorScheme.secondaryContainer,
      width: 150,
      child: Column(
        children: [
          WindowTitle(),
          Center(
            child: Text('Nav'),
          )
        ],
      ),
    );
  }
}
