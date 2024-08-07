enum HostAuthType {
  password,
  key,
  none,
}

class Host {
  Host({
    required this.name,
    required this.url,
    this.port = 22,
    this.username,
    this.authType = HostAuthType.none,
    this.password,
    this.savePassword = true,
    this.keyPath,
  });

  String name;
  int port;
  String url;

  String? username;
  HostAuthType authType;
  String? password;
  bool savePassword;
  String? keyPath;

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      name: json['name'],
      username: json['username'],
      url: json['url'],
      port: json['port'],
    );
  }

  set hostName(String? newName) {
    if (newName == null || newName.isEmpty) return;
    name = newName;
  }

  set hostPort(int? newPort) {
    if (newPort == null || newPort < 1 || newPort > 65534) {
      return;
    }
    port = newPort;
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'username': username,
      'port': port,
      'url': url,
    };
  }

  @override
  bool operator ==(Object other) {
    return other is Host &&
        other.name == name &&
        other.username == username &&
        other.port == port &&
        other.url == url;
  }

  @override
  int get hashCode => name.hashCode + username.hashCode + port + url.hashCode;
}
