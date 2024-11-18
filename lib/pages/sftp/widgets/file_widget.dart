import 'package:dartssh3/dartssh3.dart';
import 'package:flutter/material.dart';
import 'package:sftp_client/pages/sftp/models/file.dart';

class FileWidget extends StatefulWidget {
  const FileWidget({
    super.key,
    required this.file,
    this.onDoubleTap,
  });

  static int fileWidth = 100;

  final File file;
  final VoidCallback? onDoubleTap;

  @override
  State<FileWidget> createState() => _FileWidgetState();
}

class _FileWidgetState extends State<FileWidget> {
  bool isHovering = false;

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Container(
      width: 100,
      height: 100,
      margin: const EdgeInsets.all(4),
      padding: const EdgeInsets.all(4),
      decoration: BoxDecoration(
        color: isHovering ? colorScheme.onSecondaryContainer : null,
        borderRadius: BorderRadius.circular(4),
      ),
      child: InkWell(
        onTap: () {},
        onDoubleTap: () {
          if (widget.onDoubleTap != null) {
            widget.onDoubleTap!();
          }
        },
        onHover: (value) => setState(() => isHovering = value),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              widget.file.isDirectory ? Icons.folder : Icons.description,
              color: widget.file.isDirectory ? Colors.blue : Colors.white,
              size: 60,
            ),
            Text(
              widget.file.name,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
