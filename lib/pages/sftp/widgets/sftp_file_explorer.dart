import 'package:flutter/material.dart';
import 'package:sftp_client/pages/sftp/models/sftp_connection.dart';
import 'package:sftp_client/pages/sftp/widgets/file_widget.dart';

class SFTPFileExplorer extends StatefulWidget {
  const SFTPFileExplorer({
    super.key,
    required this.sftp,
  });

  final SFTPConnection sftp;

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
    return FutureBuilder(
      future: widget.sftp.listDir(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }
        final files = snapshot.data!;
        return LayoutBuilder(builder: (context, constraints) {
          return Container(
            margin: const EdgeInsets.all(8),
            padding: const EdgeInsets.all(8),
            color: Theme.of(context).colorScheme.secondaryContainer,
            width: constraints.maxWidth / 2,
            height: MediaQuery.of(context).size.height - 160,
            child: GridView.count(
              crossAxisCount: 4,
              children: files.map((file) {
                final isDirectory = file.attr.isDirectory;

                return FileWidget(
                  file: file,
                  isDirectory: isDirectory,
                  onDoubleTap: () {
                    if (isDirectory) {
                      enterDirectory(file.filename);
                    }
                  },
                );
              }).toList(),
            ),
          );
        });
      },
    );
  }
}
