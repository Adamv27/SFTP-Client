import 'dart:io';

import 'package:flutter/material.dart';
import 'package:sftp_client/pages/sftp/widgets/file_explorer/tool_bar.dart';
import 'package:sftp_client/pages/sftp/widgets/file_widget.dart';
import 'package:sftp_client/pages/sftp/models/file.dart';

class LocalFileExplorer extends StatelessWidget {
  const LocalFileExplorer({
    super.key,
    required this.width,
  });

  Future<List<FileSystemEntity>> listFiles() async {
    List<FileSystemEntity> files = [];
    final homePath = Platform.environment['USERPROFILE'];
    if (homePath == null) {
      return files;
    }
    final dir = Directory(homePath);
    return dir.listSync();
  }

  final double width;

  @override
  Widget build(BuildContext context) {
    final filesPerRow = width ~/ FileWidget.fileWidth;

    return Column(
      children: [
        ToolBar(workingDirectory: '/test', onBackButton: () {}),
        FutureBuilder(
          future: listFiles(),
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

  Widget _buildFileGrid(List<FileSystemEntity> files) {
    final filesPerRow = width ~/ FileWidget.fileWidth;

    return Expanded(
        child: GridView.count(
      crossAxisCount: filesPerRow,
      children: files.map(
        (entity) {
          if (entity is Directory) {
            //print('DIR!');
          }
          return FileWidget(
            file: File.fromFileSystemEntity(entity),
            onDoubleTap: () {
              if (entity is Directory) {}
            },
          );
        },
      ).toList(),
    ));
  }
}
