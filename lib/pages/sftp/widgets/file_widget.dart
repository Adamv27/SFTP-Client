import 'package:dartssh3/dartssh3.dart';
import 'package:flutter/material.dart';

class FileWidget extends StatefulWidget {
  const FileWidget(
      {super.key,
      required this.file,
      required this.isDirectory,
      this.onDoubleTap});

  final SftpName file;
  final bool isDirectory;
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
              widget.isDirectory ? Icons.folder : Icons.description,
              color: widget.isDirectory ? Colors.blue : Colors.white,
              size: 40,
            ),
            Text(
              widget.file.filename,
              overflow: TextOverflow.ellipsis,
            ),
          ],
        ),
      ),
    );
  }
}
