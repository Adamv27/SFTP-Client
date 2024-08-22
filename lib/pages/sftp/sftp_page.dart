import 'dart:io';
import 'package:dartssh3/dartssh3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'package:sftp_client/pages/hosts/providers/hosts_provider.dart';
import 'package:sftp_client/pages/sftp/providers/selected_host_provider.dart';

class SFTPPage extends ConsumerWidget {
  const SFTPPage({super.key});

  Future<void> connectToSelectedHost(WidgetRef ref) async {
    Host? host = ref.read(selectedHostProvider);
    if (host == null) return;

    String keyPem = await File(host.keyPath!).readAsString();
    print(host.port);
    final client = SSHClient(
      await SSHSocket.connect(host.url, host.port),
      username: host.username!,
      identities: [...SSHKeyPair.fromPem(keyPem)],
    );

    await client.authenticated;
    final sftp = await client.sftp();
    final items = await sftp.listdir('/home/${host.username}');
    for (final item in items) {
      print(item.longname);
    }

    sftp.close();
    client.close();
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hostsState = ref.watch(hostsListProvider);
    final selectedHost = ref.watch(selectedHostProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SFTP'),
        const SizedBox(height: 10),
        hostsState.when(
          data: (hosts) => _buildHostsDropdown(ref, hosts),
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) {
            print(error);
            return Container();
          },
        ),
        ElevatedButton(
          onPressed: () async {
            await connectToSelectedHost(ref);
          },
          child: const Text('connect'),
        ),
      ],
    );
  }

  Widget _buildHostsDropdown(WidgetRef ref, List<Host> hosts) {
    return DropdownMenu<Host>(
      initialSelection: ref.read(selectedHostProvider),
      enableSearch: false,
      dropdownMenuEntries: [
        ...hosts.map((host) => DropdownMenuEntry(
              value: host,
              label: host.name,
            ))
      ],
      onSelected: (value) {
        if (value == null) return;
        ref.read(selectedHostProvider.notifier).selectHost(value);
      },
    );
  }
}
