import 'package:dartssh3/dartssh3.dart';
import 'package:flutter/material.dart';
import 'package:sftp_client/pages/sftp/widgets/directory_widget.dart';

class FileWidget extends StatefulWidget {
  const FileWidget({
    super.key,
    required this.file,
  });

  final SftpName file;

  @override
  State<FileWidget> createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  bool isHovering = false;
  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isHovering ? colorScheme.onSecondaryContainer : null,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: () {},
        onHover: (value) => setState(() => isHovering = value),
        child: widget.file.attr.isDirectory
            ? DirectoryWidget(directory: widget.file)
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.description,
                    size: 40,
                  ),
                  Text(
                    widget.file.filename,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
      ),
    );
  }
}
