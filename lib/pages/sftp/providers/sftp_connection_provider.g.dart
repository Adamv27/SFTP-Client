// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sftp_connection_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$listDirHash() => r'4ee399f4b57475560b748b00b57b501518fead9e';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [listDir].
@ProviderFor(listDir)
const listDirProvider = ListDirFamily();

/// See also [listDir].
class ListDirFamily extends Family<AsyncValue<List<SftpName>>> {
  /// See also [listDir].
  const ListDirFamily();

  /// See also [listDir].
  ListDirProvider call(
    String path,
  ) {
    return ListDirProvider(
      path,
    );
  }

  @override
  ListDirProvider getProviderOverride(
    covariant ListDirProvider provider,
  ) {
    return call(
      provider.path,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'listDirProvider';
}

/// See also [listDir].
class ListDirProvider extends AutoDisposeFutureProvider<List<SftpName>> {
  /// See also [listDir].
  ListDirProvider(
    String path,
  ) : this._internal(
          (ref) => listDir(
            ref as ListDirRef,
            path,
          ),
          from: listDirProvider,
          name: r'listDirProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$listDirHash,
          dependencies: ListDirFamily._dependencies,
          allTransitiveDependencies: ListDirFamily._allTransitiveDependencies,
          path: path,
        );

  ListDirProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.path,
  }) : super.internal();

  final String path;

  @override
  Override overrideWith(
    FutureOr<List<SftpName>> Function(ListDirRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: ListDirProvider._internal(
        (ref) => create(ref as ListDirRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        path: path,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<List<SftpName>> createElement() {
    return _ListDirProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is ListDirProvider && other.path == path;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, path.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin ListDirRef on AutoDisposeFutureProviderRef<List<SftpName>> {
  /// The parameter `path` of this provider.
  String get path;
}

class _ListDirProviderElement
    extends AutoDisposeFutureProviderElement<List<SftpName>> with ListDirRef {
  _ListDirProviderElement(super.provider);

  @override
  String get path => (origin as ListDirProvider).path;
}

String _$currentSFTPConnectionHash() =>
    r'2f67e2e3d3244e0feafe83d7ecf6eaa5b0c1f519';

/// See also [CurrentSFTPConnection].
@ProviderFor(CurrentSFTPConnection)
final currentSFTPConnectionProvider =
    AsyncNotifierProvider<CurrentSFTPConnection, SFTPConnection?>.internal(
  CurrentSFTPConnection.new,
  name: r'currentSFTPConnectionProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$currentSFTPConnectionHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$CurrentSFTPConnection = AsyncNotifier<SFTPConnection?>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
