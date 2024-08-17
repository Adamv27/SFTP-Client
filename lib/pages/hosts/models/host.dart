import 'package:flutter/material.dart';

enum HostAuthType {
  password,
  key,
  none,
}

class Host {
  Host({
    required String name,
    required this.url,
    int port = 22,
    this.username,
    this.authType = HostAuthType.none,
    this.password,
    this.savePassword = true,
    this.keyPath,
  })  : _name = name,
        _port = port;

  String _name;
  int _port;
  String url;

  String? username;
  HostAuthType authType;
  String? password;
  bool savePassword;
  String? keyPath;

  set name(String? newName) {
    if (newName == null || newName.isEmpty) return;
    _name = newName;
  }

  set port(int? newPort) {
    if (newPort == null || newPort < 1 || newPort > 65535) {
      return;
    }
    _port = newPort;
  }

  int get port => _port;
  String get name => _name;

  Icon get authTypeIcon {
    switch (authType) {
      case HostAuthType.none:
        return const Icon(Icons.lock_open);
      case HostAuthType.key:
        return const Icon(Icons.key);
      case HostAuthType.password:
        return const Icon(Icons.password);
    }
  }

  Map<String, dynamic> toJson() {
    return {
      'name': _name,
      'username': username,
      'port': _port,
      'url': url,
    };
  }

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      name: json['name'],
      username: json['username'],
      url: json['url'],
      port: json['port'],
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
