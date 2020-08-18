import 'package:flutter/material.dart';
import 'post.dart';
import 'TextInputWidget.dart';
import 'PostList.dart';

class MyHomePage extends StatefulWidget {
  final String name;
  MyHomePage(this.name);
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Post> posts = [];
/*  String text = "";
  void changeText(String text) {
    this.setState(() {
      //    this.text = text;
    });
  }
*/
  void newPost(String text) {
    this.setState(() {
      posts.add(new Post(text, widget.name));
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Konichiwa')),
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts)),
          TextInputWidget(this.newPost)
          //      Text(this.text)
        ]));
  }
}
/*
class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Konichiwa')), body: TextInputWidget());
  }
}*/
