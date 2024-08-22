import 'package:sftp_client/pages/hosts/models/host_auth_type.dart';

class Host {
  Host({
    required String name,
    required this.url,
    int port = 22,
    this.username,
    this.authType = HostAuthType.none,
    String? password,
    this.savePassword = true,
    String? keyPath,
  })  : _name = name,
        _port = port,
        _password = password,
        _keyPath = keyPath;

  String _name;
  int _port;
  String url;

  String? username;
  HostAuthType authType;
  String? _password;
  bool savePassword;
  String? _keyPath;

  set name(String? newName) {
    if (newName == null || newName.isEmpty) return;
    _name = newName;
  }

  set port(int? newPort) {
    if (newPort == null || newPort < 1 || newPort > 65535) return;
    _port = newPort;
  }

  set password(String? newPassword) {
    if (newPassword == null || newPassword.isEmpty) {
      authType = HostAuthType.none;
    } else {
      authType = HostAuthType.password;
    }
    _password = newPassword;
  }

  set keyPath(String? newKeyPath) {
    if (newKeyPath == null || newKeyPath.isEmpty) {
      authType = HostAuthType.none;
    } else {
      authType = HostAuthType.key;
    }
    _keyPath = newKeyPath;
  }

  int get port => _port;
  String get name => _name;
  String? get password => _password;
  String? get keyPath => _keyPath;

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'username': username,
      'port': _port,
      'url': url,
      'password': savePassword ? _password : null,
      'keyPath': _keyPath,
      'authType': authType.name,
    };
  }

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      name: json['name'],
      username: json['username'],
      url: json['url'],
      port: json['port'],
      password: json['password'],
      keyPath: json['keyPath'],
      authType: HostAuthType.values.byName(json['authType']),
    );
  }

  @override
  bool operator ==(Object other) {
    return other is Host &&
        other.name == _name &&
        other.username == username &&
        other.port == _port &&
        other.url == url;
  }

  @override
  int get hashCode => _name.hashCode + username.hashCode + port + url.hashCode;
}
