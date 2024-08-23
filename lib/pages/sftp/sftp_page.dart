import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/sftp/widgets/host_dropdown.dart';
import 'package:sftp_client/pages/sftp/widgets/sftp_file_explorer.dart';

class SFTPPage extends ConsumerWidget {
  const SFTPPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('SFTP'),
        SizedBox(height: 10),
        HostDropdown(),
        SFTPFileExplorer(),
      ],
    );
  }
}
