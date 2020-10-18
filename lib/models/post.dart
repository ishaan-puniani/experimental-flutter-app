import 'photo.dart';
import 'connection.dart';

class Post {
  final String id;
  final String title;
  final Connection connection;
  final  List<Photo> photos;
  Post({this.id, this.title, this.connection, this.photos});

  factory Post.fromJson(Map<String, dynamic> json) {
    var list = json['photos'] as List;
    List<Photo> photos = list==null ? null : list.map((i) => Photo.fromJson(i)).toList();

    return Post(
      id: json['id'],
      title: json['title'],
      connection: Connection.fromJson(json['connection']),
      photos: photos
    );
  }
}