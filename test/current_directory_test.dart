import 'package:sftp_client/pages/sftp/models/current_directory.dart';
import 'package:test/test.dart';

void main() {
  test('Enter Dir', () {
    final currentDirectory = CurrentDirectory(fullPath: '/home/user');

    currentDirectory.enterDirectory('files');
    expect(currentDirectory.fullPath, '/home/user/files/');
  });

  test('Move Back', () {
    final currentDirectory = CurrentDirectory(fullPath: '/home/user');
    currentDirectory.enterDirectory('..');
    expect(currentDirectory.fullPath, '/home/');
  });
}
