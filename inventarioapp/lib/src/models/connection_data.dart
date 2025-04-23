class ConnectionData {
  final String url;
  final int port;
  final String user;
  final String password;

  ConnectionData({
    required this.url,
    required this.port,
    required this.user,
    required this.password,
  });

  Map<String, dynamic> toJson() => {
    'url': url,
    'port': port,
    'user': user,
    'password': password,
  };
}
