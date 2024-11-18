import 'package:dartssh3/dartssh3.dart';
import 'package:flutter/material.dart';
import 'package:sftp_client/pages/sftp/models/file.dart';
import 'package:sftp_client/pages/sftp/models/sftp_connection.dart';
import 'package:sftp_client/pages/sftp/widgets/file_explorer/tool_bar.dart';
import 'package:sftp_client/pages/sftp/widgets/file_widget.dart';

class SFTPFileExplorer extends StatefulWidget {
  const SFTPFileExplorer({
    super.key,
    required this.sftp,
    required this.width,
  });

  final SFTPConnection sftp;
  final double width;

  @override
  State<SFTPFileExplorer> createState() => _SFTPFileExplorerState();
}

class _SFTPFileExplorerState extends State<SFTPFileExplorer> {
  void enterDirectory(String directoryName) {
    widget.sftp.enterDirectory(directoryName);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToolBar(
          workingDirectory: widget.sftp.workingDirectory,
          onBackButton: () {
            enterDirectory('..');
          },
        ),
        FutureBuilder(
          future: widget.sftp.listDir(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Container();
            }
            final files = snapshot.data;
            if (files == null) return Container();
            return _buildFileGrid(files);
          },
        ),
      ],
    );
  }

  Widget _buildFileGrid(List<SftpName> files) {
    final filesPerRow = widget.width ~/ FileWidget.fileWidth;

    return Expanded(
        child: GridView.count(
      crossAxisCount: filesPerRow,
      children: files.map(
        (file) {
          final isDirectory = file.attr.isDirectory;

          return FileWidget(
            file: File.fromSftpName(file),
            onDoubleTap: () {
              if (isDirectory) {
                enterDirectory(file.filename);
              }
            },
          );
        },
      ).toList(),
    ));
  }
}
