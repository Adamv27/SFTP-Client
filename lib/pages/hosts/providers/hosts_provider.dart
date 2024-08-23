import 'dart:convert';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:sftp_client/pages/hosts/models/host.dart';
import 'package:sftp_client/storage_provider.dart';

part 'hosts_provider.g.dart';

@Riverpod(keepAlive: true)
class HostsList extends _$HostsList {
  @override
  Future<List<Host>> build() async {
    final storage = ref.watch(secureStorageProvider);
    final hostsData = await storage.read(key: 'hosts');
    if (hostsData == null) return List.empty();

    final List<dynamic> hostsJson = jsonDecode(hostsData);
    return hostsJson.map((json) => Host.fromJson(json)).toList();
  }

  Future<void> addHost(Host host) async {
    final storage = ref.read(secureStorageProvider);
    final hosts = await build();
    final updatedHosts = [...hosts, host];

    final hostsJson = hosts.map((host) => host.toJson()).toList();
    hostsJson.add(host.toJson());
    await storage.write(key: 'hosts', value: jsonEncode(hostsJson));
    state = AsyncValue.data(updatedHosts);
  }

  Future<void> removeHost(Host hostToRemove) async {
    final storage = ref.read(secureStorageProvider);

    final hosts = await build();
    final updatedHosts = hosts.where((host) => host != hostToRemove);
    final hostsJson = updatedHosts.map((host) => host.toJson()).toList();
    await storage.write(key: 'hosts', value: jsonEncode(hostsJson));
    state = AsyncValue.data(updatedHosts.toList());
  }
}
