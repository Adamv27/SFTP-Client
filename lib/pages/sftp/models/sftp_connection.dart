import 'package:dartssh3/dartssh3.dart';
import 'package:sftp_client/pages/sftp/models/current_directory.dart';
import 'package:sftp_client/pages/sftp/models/ssh_connection.dart';

class SFTPConnection {
  final _currentDirectory = CurrentDirectory(fullPath: '/home/');
  late SftpClient _sftpClient;

  Future<void> connect(SSHConnection sshConnection) async {
    _sftpClient = await sshConnection.client.sftp();
    final username = sshConnection.host.username;
    if (username != null) {
      _currentDirectory.enterDirectory(username);
    }
    print('Connected to SFTP');
  }

  void disconnect() {
    _sftpClient.close();
    print('Disconnected from SFTP');
  }

  Future<List<SftpName>> listDir() async {
    final files = await _sftpClient.listdir(_currentDirectory.fullPath);
    files.sort((a, b) => a.filename.compareTo(b.filename));
    return files;
  }

  void enterDirectory(String directoryName) {
    _currentDirectory.enterDirectory(directoryName);
  }

  SftpClient get client => _sftpClient;
  String get workingDirectory => _currentDirectory.fullPath;
}
