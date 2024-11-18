import 'dart:io';

import 'package:dartssh3/dartssh3.dart';
import 'package:path/path.dart' as path;

class File {
  File({
    required this.name,
    required this.isDirectory,
  });

  final String name;
  final bool isDirectory;

  factory File.fromSftpName(SftpName sftpFile) {
    return File(
      name: sftpFile.filename,
      isDirectory: sftpFile.attr.isDirectory,
    );
  }

  factory File.fromFileSystemEntity(FileSystemEntity fileSystemEntity) {
    final bool isDirectory = fileSystemEntity is Directory;

    final String name = path.basename(fileSystemEntity.path);

    return File(
      name: name,
      isDirectory: isDirectory,
    );
  }
}
