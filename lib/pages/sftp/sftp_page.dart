import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/sftp/providers/sftp_connection_provider.dart';
import 'package:sftp_client/pages/sftp/widgets/host_dropdown.dart';
import 'package:sftp_client/pages/sftp/widgets/sftp_file_explorer.dart';

class SFTPPage extends ConsumerWidget {
  const SFTPPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sftpConnection = ref.watch(currentSFTPConnectionProvider);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('SFTP'),
        const SizedBox(height: 10),
        const HostDropdown(),
        sftpConnection.when(
          data: (sftp) {
            if (sftp == null) {
              return Container();
            }
            return SFTPFileExplorer(sftp: sftp);
          },
          error: (error, stacktrace) => const Text('Error connecting to SFTP'),
          loading: () => const CircularProgressIndicator(),
        ),
      ],
    );
  }
}
