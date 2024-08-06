import 'dart:io';
import 'package:dartssh2/dartssh2.dart';
import 'package:flutter/material.dart';

class UploadPage extends StatelessWidget {
  const UploadPage({super.key});

  Future<void> connectToServer() async {
    const url = String.fromEnvironment("SERVER_URL");
    const username = String.fromEnvironment("SERVER_USERNAME");
    final int port = int.parse(const String.fromEnvironment("SERVER_PORT"));
    const keyPath = String.fromEnvironment("PUBLIC_KEY_PATH");

    print('Connecting to $username@$url:$port');

    String keyPem = await File(keyPath).readAsString();

    final client = SSHClient(
      await SSHSocket.connect(url, port),
      username: username,
      identities: [...SSHKeyPair.fromPem(keyPem)],
    );

    final sftp = await client.sftp();
    final items = await sftp.listdir('/home/adam');
    for (final item in items) {
      print(item.longname);
    }

    client.close();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Upload'),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: () async {
            await connectToServer();
          },
          child: const Text('connect'),
        )
      ],
    );
  }
}
