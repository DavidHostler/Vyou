import 'package:flutter/material.dart';
import 'package:arkit_plugin/arkit_plugin.dart';
import 'package:vector_math/vector_math_64.dart';
import 'package:flutter/cupertino.dart';
import 'package:pleroma/get_data.dart';

import 'package:dio/dio.dart';

import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/src/material/colors.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';
//import 'http/posts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: DataFromAPI(),
    );
  }
}

class DataFromAPI extends StatefulWidget {
  @override
  _DataFromAPIState createState() => _DataFromAPIState();
}

class _DataFromAPIState extends State<DataFromAPI> {
  getUsetData() async {
    var response =
        await http.get(Uri.https('https://vu-ar.herokuapp.com/', 'posts'));
    var jsonData = jsonDecode(response.body);
    List<Post> posts = [];

    for (var x in jsonData) {
      Post post = Post(x['post_id'], x['description']);
      posts.add(post);
    }
    print(posts.length);
    return posts;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Data"),
        ),
        body: Container(child: Card(
          child: FutureBuilder(builder: (context, AsyncSnapshot snapshot) {
            if (snapshot.data == null) {
              return Container(
                child: Center(
                  child: Text('...Loading'),
                ),
              );
            } else
              return ListView.builder(
                  itemCount: snapshot.data.length,
                  itemBuilder: (context, i) {
                    return ListTile(
                      title: Text(snapshot.data[i].post_id),
                      subtitle: Text(snapshot.data[i].description),
                    );
                  });
          }),
        )));
  }
}

class Post {
  final int post_id;
  final String description;
  Post(this.post_id, this.description);
}


// void main() => runApp(MaterialApp(home: MyApp()));

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: HomeScreen(),
//       // home: Scaffold(
//       //   appBar: AppBar(title),
//       // )
//     );
//   }
// }

// class HomeScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('First Screen'),
//       ),
//       body: ElevatedButton(
//         child: Text("Go to second page"),
//         onPressed: () {
//           Navigator.push(context,
//               MaterialPageRoute(builder: ((context) => CameraScreen())));
//         },
//       ),
//     );
//   }
// }

// class CameraScreen extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('Camera Screen'),
//       ),
//     );
//   }
// }
