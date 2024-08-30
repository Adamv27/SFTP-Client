import 'package:flutter/material.dart';
import 'package:sftp_client/pages/sftp/widgets/file_explorer/tool_bar.dart';

class LocalFileExplorer extends StatelessWidget {
  const LocalFileExplorer({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ToolBar(workingDirectory: '/test', onBackButton: () {}),
      ],
    );
  }
}
