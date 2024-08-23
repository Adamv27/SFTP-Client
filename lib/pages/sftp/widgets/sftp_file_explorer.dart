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
      data: (sftp) => _buildFileExplorer(ref, sftp),
      error: (error, stacktrace) => Container(),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildFileExplorer(WidgetRef ref, SFTPConnection? sftp) {
    if (sftp == null) return Container();

    final results = ref.watch(listDirProvider('/home/'));

    return results.when(
      data: (files) => SizedBox(
        height: 300,
        child: SingleChildScrollView(
          child: Column(
            children: [
              ...files.map((file) => Text(file.filename)),
            ],
          ),
        ),
      ),
      error: (error, stackTrace) => Container(),
      loading: () => CircularProgressIndicator(),
    );
  }
}
