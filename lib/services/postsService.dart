import 'dart:convert';
import 'package:experimental_flutter_plugin/models/post.dart';
import 'package:http/http.dart' as http;


Future<List<Post>> fetchPosts(int limit, int offset) async {
  final response = await http.get('http://my-json-server.typicode.com/ishaan-puniani/experimental-flutter-plugin/posts');

  if (response.statusCode == 200) {
    // If the server did return a 200 OK response,
    // then parse the JSON.
    var rb = response.body;

    // store json data into list
    var list = json.decode(rb) as List;

    // iterate over the list and map each object in list to Img by calling Img.fromJson
    List<Post> posts = list.map((i)=>Post.fromJson(i)).toList();

    print(posts.runtimeType); //returns List<Img>
    print(posts[0].runtimeType); //returns Img

    return posts;
  } else {
    // If the server did not return a 200 OK response,
    // then throw an exception.
    throw Exception('Failed to load posts');
  }
}