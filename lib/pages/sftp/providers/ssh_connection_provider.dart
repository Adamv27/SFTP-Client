import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'package:sftp_client/pages/sftp/models/ssh_connection.dart';

part 'ssh_connection_provider.g.dart';

@Riverpod(keepAlive: true)
class CurrentSSHConnection extends _$CurrentSSHConnection {
  @override
  Future<SSHConnection?> build() async {
    return null;
  }

  Future<void> startConnection(Host host) async {
    final sshConnection = SSHConnection();
    await sshConnection.connect(host);
    state = AsyncValue.data(sshConnection);
  }

  Future<void> closeConnection() async {
    state.whenData((data) => data!.disconnect());
    state = const AsyncValue.data(null);
  }
}
