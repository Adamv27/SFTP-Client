import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sftp_client/pages/sftp/models/sftp_connection.dart';
import 'package:sftp_client/pages/sftp/providers/ssh_connection_provider.dart';

part 'sftp_connection_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentSFTPConnection extends _$CurrentSFTPConnection {
  @override
  Future<SFTPConnection?> build() async {
    final sshConnection = await ref.watch(currentSSHConnectionProvider.future);
    if (sshConnection == null) return null;
    final sftp = SFTPConnection();
    await sftp.connect(sshConnection);
    return sftp;
  }
}
