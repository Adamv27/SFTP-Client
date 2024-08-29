import 'package:dartssh3/dartssh3.dart';
import 'package:sftp_client/pages/sftp/models/current_directory.dart';
import 'package:sftp_client/pages/sftp/models/ssh_connection.dart';

class SFTPConnection {
  final _currentDirectory = CurrentDirectory(fullPath: '/');
  late SftpClient _sftpClient;

  Future<void> connect(SSHConnection sshConnection) async {
    _sftpClient = await sshConnection.client.sftp();
    print('Connected to SFTP');
  }

  void disconnect() {
    _sftpClient.close();
    print('Disconnected from SFTP');
  }

  Future<List<SftpName>> listDir() async {
    print('Listing directory ${_currentDirectory.fullPath}');
    List<SftpName> data = List.empty();
    try {
      data = await _sftpClient.listdir(_currentDirectory.fullPath);
      print('FILES: ${data}');
      data.sort((a, b) => a.filename.compareTo(b.filename));
      return data;
    } catch (e) {
      print(e);
    }
    return data;
  }

  void enterDirectory(String directoryName) {
    _currentDirectory.enterDirectory(directoryName);
  }

  SftpClient get client => _sftpClient;
  String get workingDirectory => _currentDirectory.fullPath;
}
