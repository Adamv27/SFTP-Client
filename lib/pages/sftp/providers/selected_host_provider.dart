import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';

part 'selected_host_provider.g.dart';

@Riverpod(keepAlive: true)
class SelectedHost extends _$SelectedHost {
  @override
  Host? build() {
    return null;
  }

  void selectHost(Host host) {
    state = host;
  }

  void clearSelection() {
    state = null;
  }
}
