import 'package:dartssh3/dartssh3.dart';
import 'package:sftp_client/pages/sftp/models/ssh_connection.dart';

class SFTPConnection {
  late SftpClient _sftpClient;

  Future<void> connect(SSHConnection sshConnection) async {
    _sftpClient = await sshConnection.client.sftp();
    print('Connected to SFTP');
  }

  Future<void> disconnect() async {
    _sftpClient.close();
    print('Disconnected from SFTP');
  }

  SftpClient get client => _sftpClient;
}
