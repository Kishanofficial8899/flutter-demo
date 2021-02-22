import 'dart:convert';
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

Future<List<UserPhotos>> fetchPhotos() async {
  final response =
      await http.get('https://jsonplaceholder.typicode.com/photos');
  if (response.statusCode == 200) {
    List jsonResponse = json.decode(response.body);
    return jsonResponse.map((data) => new UserPhotos.fromJson(data)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

ListTile _tile(String title, thumbnailUrl) => ListTile(
    title: Text(title),
    leading: Image(
      image: NetworkImage(thumbnailUrl),
    ));

class UserPhotos {
  final String title;
  final String thumbnailUrl;

  UserPhotos({this.title, this.thumbnailUrl});

  factory UserPhotos.fromJson(Map<String, dynamic> json) {
    return UserPhotos(
      title: json['title'],
      thumbnailUrl: json['thumbnailUrl'],
    );
  }
}

class JsonPage extends StatefulWidget {
  @override
  _JsonPageState createState() => _JsonPageState();
}

class _JsonPageState extends State<JsonPage> {
  Future<UserPhotos> userPhotos;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Fake Json"),
      ),
      body: FutureBuilder<List<UserPhotos>>(
        future: fetchPhotos(),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            List<UserPhotos> data = snapshot.data;
            return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return _tile(data[index].title, data[index].thumbnailUrl);
                });
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}
