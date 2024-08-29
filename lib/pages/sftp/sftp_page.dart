import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/sftp/providers/sftp_connection_provider.dart';
import 'package:sftp_client/pages/sftp/widgets/host_dropdown.dart';
import 'package:sftp_client/pages/sftp/widgets/local_file_explorer.dart';
import 'package:sftp_client/pages/sftp/widgets/sftp_file_explorer.dart';

class SFTPPage extends ConsumerWidget {
  const SFTPPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sftpConnection = ref.watch(currentSFTPConnectionProvider);

    return LayoutBuilder(builder: (context, constraints) {
      const padding = 8;
      final double explorerWidth = constraints.maxWidth / 2 - padding;
      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('SFTP'),
          const SizedBox(height: 10),
          const HostDropdown(),
          SizedBox(
            height: MediaQuery.of(context).size.height - 160,
            child: Row(
              children: [
                LocalFileExplorer(width: explorerWidth),
                sftpConnection.when(
                  data: (sftp) {
                    if (sftp == null) {
                      return _connectToHostMessage(context, explorerWidth);
                    }
                    return SFTPFileExplorer(sftp: sftp, width: explorerWidth);
                  },
                  error: (error, stacktrace) =>
                      const Text('Error connecting to SFTP'),
                  loading: () => const CircularProgressIndicator(),
                ),
              ],
            ),
          ),
        ],
      );
    });
  }

  Widget _connectToHostMessage(BuildContext context, double width) {
    return Container(
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
          border: Border.all(
              width: 3,
              color: Theme.of(context).colorScheme.secondaryContainer)),
      width: width,
      child: const Center(
        child: Text('Connect to Host'),
      ),
    );
  }
}
