import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'package:sftp_client/pages/hosts/providers/hosts_provider.dart';
import 'package:sftp_client/pages/sftp/providers/ssh_connection_provider.dart';

class HostDropdown extends ConsumerStatefulWidget {
  const HostDropdown({
    super.key,
  });

  @override
  ConsumerState<HostDropdown> createState() => _HostDropdownState();
}

class _HostDropdownState extends ConsumerState<HostDropdown> {
  Host? currentSelection;

  Future<void> connectToHost(WidgetRef ref) async {
    if (currentSelection == null) return;

    final sshConnection = ref.read(currentSSHConnectionProvider.notifier);
    await sshConnection.startConnection(currentSelection!);
  }

  Future<void> disconnectFromHost(WidgetRef ref) async {
    final sshConnection = ref.read(currentSSHConnectionProvider.notifier);
    await sshConnection.closeConnection();
  }

  @override
  Widget build(BuildContext context) {
    final hostsState = ref.watch(hostsListProvider);
    return Row(
      children: [
        hostsState.when(
          data: (hosts) => _buildHostsDropdown(ref, hosts),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            print(error);
            return Container();
          },
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () => connectToHost(ref),
          child: const Text('Connect'),
        ),
        const SizedBox(width: 5),
        ElevatedButton(
          onPressed: () => disconnectFromHost(ref),
          child: const Text('Disconnect'),
        )
      ],
    );
  }

  Widget _buildHostsDropdown(ref, hosts) {
    return DropdownMenu<Host>(
      initialSelection: currentSelection,
      enableSearch: false,
      dropdownMenuEntries: [
        ...hosts.map((host) => DropdownMenuEntry<Host>(
              value: host,
              label: host.name,
            ))
      ],
      onSelected: (value) {
        if (value == null) return;
        setState(() => currentSelection = value);
      },
    );
  }
}
