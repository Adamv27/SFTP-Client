import 'dart:io';

import 'package:dartssh3/dartssh3.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';

class SSHConnection {
  late Host _host;
  late SSHClient _client;

  Future<void> connect(Host host) async {
    final socket = await SSHSocket.connect(host.url, host.port);
    String keyPem = await File(host.keyPath!).readAsString();

    _client = SSHClient(
      socket,
      username: host.username!,
      identities: [...SSHKeyPair.fromPem(keyPem)],
    );
    _host = host;
    await _client.authenticated;
    print('Connected to SSH');
  }

  Future<void> disconnect() async {
    if (_client.isClosed) return;
    _client.close();
    print('Disconnected from SSH');
  }

  SSHClient get client => _client;
  Host get host => _host;
}
