import 'package:flutter/material.dart';

class HostCard extends StatelessWidget {
  const HostCard({
    super.key,
    required this.name,
    required this.url,
    required this.username,
    required this.port,
  });

  final String name;
  final String url;
  final String username;
  final int port;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      constraints: const BoxConstraints(
        maxWidth: 500,
      ),
      decoration: BoxDecoration(
        color: colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: ListTile(
        leading: Container(
          width: 50,
          decoration: BoxDecoration(
            color: colorScheme.secondary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Center(
            child: Text(
              name[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onTap: () {
          print('Connecting to $username@$url');
        },
        title: Text(
          name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        subtitle: _buildHostInfo(colorScheme),
      ),
    );
  }

  Row _buildHostInfo(ColorScheme colorScheme) {
    return Row(
      children: [
        Text(
          username,
          style: TextStyle(color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(width: 4),
        Text('@', style: TextStyle(color: colorScheme.onSecondaryContainer)),
        const SizedBox(width: 4),
        Text(
          url,
          style: TextStyle(color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(width: 4),
        Text(':', style: TextStyle(color: colorScheme.onSecondaryContainer)),
        const SizedBox(width: 4),
        Text(
          port.toString(),
          style: TextStyle(color: colorScheme.onPrimaryContainer),
        ),
      ],
    );
  }
}
