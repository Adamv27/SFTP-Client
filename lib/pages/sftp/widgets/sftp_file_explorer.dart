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
      data: (sftp) => _buildFileExplorer(sftp),
      error: (error, stacktrace) => Container(),
      loading: () => const CircularProgressIndicator(),
    );
  }

  Widget _buildFileExplorer(SFTPConnection? sftp) {
    if (sftp == null) return Container();
    return Text('Connected to SFTP');
  }
}
