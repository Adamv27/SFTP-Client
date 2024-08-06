import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'widgets/host_card.dart';
import 'providers/hosts_provider.dart';

class HostsPage extends ConsumerWidget {
  const HostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hostsState = ref.watch(hostsListProvider);
    print(hostsState);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Hosts',
          style: TextStyle(
            color: Theme.of(context).colorScheme.onPrimaryContainer,
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        hostsState.when(
          data: (hosts) => _hostsList(hosts),
          loading: () => Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            print(error);
            return Container();
          },
        ),
        const SizedBox(height: 8),
        const Spacer(),
        _addHostButton(ref),
      ],
    );
  }

  Widget _hostsList(List<Host> hosts) {
    return SingleChildScrollView(
      child: Column(
        children: hosts.map((host) {
          return HostCard(host: host);
        }).toList(),
      ),
    );
  }

  Widget _addHostButton(WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        final newHost =
            Host(name: 'home', url: 'rde.adamvinch.com', username: 'adam');
        await ref.read(hostsListProvider.notifier).addHost(newHost);
      },
      child: const Text('Add'),
    );
  }
}
