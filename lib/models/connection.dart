class Connection {
  final String id;

  Connection({this.id});

  factory Connection.fromJson(Map<String, dynamic> json) {
    return Connection(
      id: json['id']
    );
  }
}