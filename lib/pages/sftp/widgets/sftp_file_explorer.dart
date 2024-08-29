import 'package:flutter/material.dart';
import 'package:sftp_client/pages/sftp/models/sftp_connection.dart';
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
    return FutureBuilder(
      future: widget.sftp.listDir(),
      builder: (context, snapshot) {
        if (snapshot.connectionState != ConnectionState.done) {
          return const CircularProgressIndicator();
        }
        final files = snapshot.data!;
        const toolBarHeight = 50.0;
        final filesPerRow = widget.width ~/ FileWidget.fileWidth;

        return Container(
          decoration: BoxDecoration(
              color: Theme.of(context).colorScheme.secondaryContainer,
              borderRadius: BorderRadius.circular(4)),
          margin: const EdgeInsets.all(8),
          padding: const EdgeInsets.all(8),
          width: widget.width,
          child: Column(
            children: [
              SizedBox(
                height: toolBarHeight,
                child: _buildToolBar(context),
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: filesPerRow,
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
              ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildToolBar(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        SizedBox(
          width: 35,
          height: 35,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(colorScheme.onSecondaryContainer),
              padding: const WidgetStatePropertyAll(EdgeInsets.all(0.0)),
            ),
            onPressed: () {
              enterDirectory('..');
            },
            child: const Icon(
              Icons.arrow_back,
            ),
          ),
        ),
        const SizedBox(width: 8),
        Container(
          width: 200,
          padding: const EdgeInsets.all(7),
          decoration: BoxDecoration(
            color: colorScheme.onSecondaryContainer,
            borderRadius: BorderRadius.circular(4),
          ),
          child: Text(
            widget.sftp.workingDirectory,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        const SizedBox(width: 8),
        SizedBox(
          width: 35,
          height: 35,
          child: ElevatedButton(
            style: ButtonStyle(
              backgroundColor:
                  WidgetStatePropertyAll(colorScheme.onSecondaryContainer),
              padding: const WidgetStatePropertyAll(EdgeInsets.all(0.0)),
            ),
            onPressed: () {},
            child: const Icon(
              Icons.grid_view,
            ),
          ),
        ),
      ],
    );
  }
}
