class Host {
  const Host({
    required this.name,
    required this.username,
    required this.url,
    this.port = 22,
  });

  final String name;
  final String username;
  final int port;
  final String url;

  factory Host.fromJson(Map<String, dynamic> json) {
    return Host(
      name: json['name'],
      username: json['username'],
      url: json['url'],
      port: json['port'],
    );
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
