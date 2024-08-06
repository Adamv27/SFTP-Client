import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'package:sftp_client/pages/hosts/widgets/add_host_menu.dart';
import 'widgets/host_card.dart';
import 'providers/hosts_provider.dart';

class HostsPage extends ConsumerWidget {
  const HostsPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hostsState = ref.watch(hostsListProvider);

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
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            print(error);
            return Container();
          },
        ),
        const SizedBox(height: 8),
        const Spacer(),
        _addHostButton(context, ref),
      ],
    );
  }

  Widget _hostsList(List<Host> hosts) {
    return SingleChildScrollView(
      child: Column(
        children: hosts.map((host) {
          return Padding(
            padding: const EdgeInsets.all(4.0),
            child: HostCard(host: host),
          );
        }).toList(),
      ),
    );
  }

  Widget _addHostButton(BuildContext context, WidgetRef ref) {
    return ElevatedButton(
      onPressed: () async {
        Host? newHost = await showDialog(
          context: context,
          builder: (context) => const AddHostMenu(),
        );
        if (newHost != null) {
          await ref.read(hostsListProvider.notifier).addHost(newHost);
        }
      },
      child: const Text('Add'),
    );
  }
}
