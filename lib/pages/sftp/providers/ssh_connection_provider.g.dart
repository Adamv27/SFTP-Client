// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'ssh_connection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$currentSSHConnectionHash() =>
    r'4dcdac3fa08f2002cc40af9ae512e4bbd1a1e5cd';

/// See also [CurrentSSHConnection].
@ProviderFor(CurrentSSHConnection)
final currentSSHConnectionProvider =
    AsyncNotifierProvider<CurrentSSHConnection, SSHConnection?>.internal(
  CurrentSSHConnection.new,
  name: r'currentSSHConnectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSSHConnectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentSSHConnection = AsyncNotifier<SSHConnection?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
