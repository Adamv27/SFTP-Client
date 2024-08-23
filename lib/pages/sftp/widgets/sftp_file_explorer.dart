import 'dart:async';

import 'package:dartssh3/dartssh3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/sftp/models/sftp_connection.dart';
import 'package:sftp_client/pages/sftp/providers/sftp_connection_provider.dart';

class SFTPFileExplorer extends ConsumerWidget {
  const SFTPFileExplorer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sftpConnection = ref.watch(currentSFTPConnectionProvider);
    return sftpConnection.when(
      data: (sftp) => _buildFileExplorer(context, ref, sftp),
      error: (error, stacktrace) => Container(),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildFileExplorer(
      BuildContext context, WidgetRef ref, SFTPConnection? sftp) {
    if (sftp == null) return Container();

    final results = ref.watch(listDirProvider('/home/'));

    return results.when(
      data: (files) => SizedBox(
        width: MediaQuery.of(context).size.width / 2 - 150,
        height: 300,
        child: GridView.count(
          crossAxisCount: 4,
          children: files.map((file) {
            if (file.attr.isDirectory) return _buildDirectory(file);

            return _buildFile(file);
          }).toList(),
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildDirectory(SftpName file) {
    return Column(
      children: [
        const Icon(Icons.folder),
        Text(file.filename),
      ],
    );
  }

  Widget _buildFile(SftpName file) {
    return Column(
      children: [
        const Icon(Icons.description),
        Text(file.filename),
      ],
    );
  }
}
