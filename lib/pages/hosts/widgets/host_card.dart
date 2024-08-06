import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'package:sftp_client/pages/hosts/providers/hosts_provider.dart';

class HostCard extends ConsumerWidget {
  const HostCard({
    super.key,
    required this.host,
  });

  final Host host;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
              host.name[0].toUpperCase(),
              style: const TextStyle(
                fontSize: 26,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        onTap: () {
          print('Connecting to ${host.username}@${host.url}');
        },
        title: Text(
          host.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: colorScheme.primary,
          ),
        ),
        subtitle: _buildHostInfo(colorScheme),
        trailing: _buildDeleteButton(ref),
      ),
    );
  }

  Row _buildHostInfo(ColorScheme colorScheme) {
    return Row(
      children: [
        if (host.username != null)
          Text(
            host.username!,
            style: TextStyle(color: colorScheme.onPrimaryContainer),
          ),
        if (host.username != null) const SizedBox(width: 4),
        if (host.username != null)
          Text('@', style: TextStyle(color: colorScheme.onSecondaryContainer)),
        const SizedBox(width: 4),
        Text(
          host.url,
          style: TextStyle(color: colorScheme.onPrimaryContainer),
        ),
        const SizedBox(width: 4),
        Text(':', style: TextStyle(color: colorScheme.onSecondaryContainer)),
        const SizedBox(width: 4),
        Text(
          host.port.toString(),
          style: TextStyle(color: colorScheme.onPrimaryContainer),
        ),
      ],
    );
  }

  Widget _buildDeleteButton(WidgetRef ref) {
    return IconButton(
      onPressed: () async {
        await ref.read(hostsListProvider.notifier).removeHost(host);
      },
      icon: const Icon(Icons.close),
    );
  }
}
