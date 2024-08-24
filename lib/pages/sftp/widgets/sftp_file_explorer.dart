import 'dart:async';

import 'package:dartssh3/dartssh3.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:sftp_client/pages/sftp/models/sftp_connection.dart';
import 'package:sftp_client/pages/sftp/providers/sftp_connection_provider.dart';
import 'package:sftp_client/pages/sftp/widgets/directory_widget.dart';
import 'package:sftp_client/pages/sftp/widgets/file_widget.dart';
import 'package:sftp_client/theme/app_theme.dart';

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

    final results = ref.watch(listDirProvider('/home/adam'));

    return results.when(
      data: (files) => LayoutBuilder(
        builder: (context, constraints) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.secondaryContainer,
            width: constraints.maxWidth / 2,
            height: MediaQuery.of(context).size.height - 160,
            child: GridView.count(
              crossAxisCount: 4,
              children: files.map((file) {
                return FileWidget(file: file);
              }).toList(),
            ),
          );
        },
      ),
      error: (error, stackTrace) => Container(),
      loading: () => const CircularProgressIndicator(),
    );
  }
}
