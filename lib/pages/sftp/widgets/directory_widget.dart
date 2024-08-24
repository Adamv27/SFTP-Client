import 'package:dartssh3/dartssh3.dart';
import 'package:flutter/material.dart';

class DirectoryWidget extends StatelessWidget {
  const DirectoryWidget({
    super.key,
    required this.directory,
  });
  final SftpName directory;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {},
      onDoubleTap: () {
        print('Entering ${directory.filename}');
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Icon(
            Icons.folder,
            size: 40,
            color: Colors.lightBlue,
          ),
          Text(directory.filename),
        ],
      ),
    );
  }
}
