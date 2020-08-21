import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:myfirstapp/database.dart';
import 'post.dart';
import 'TextInputWidget.dart';
import 'PostList.dart';

class MyHomePage extends StatefulWidget {
  final FirebaseUser user;
  MyHomePage(this.user);
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
      var post = new Post(text, widget.user.displayName);
      post.setId(savePost(post));
      this.setState(() {
        posts.add(post);
      });
    });
  }
  void updatePosts(){
    getAllPosts().then((posts)=>{
      this.setState((){
          this.posts = posts;
        })
      });
  }

  @override
  void initState(){
    super.initState();
    updatePosts();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text('Konichiwa')),
        body: Column(children: <Widget>[
          Expanded(child: PostList(this.posts, widget.user)),
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
