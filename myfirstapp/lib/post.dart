import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';

class Post {
  String body;
  String author;
  Set userLiked = {};
  DatabaseReference sid;
  //bool userLiked = false;
  Post(this.body, this.author);
  void likePost(FirebaseUser user) {
    if (this.userLiked.contains(user.uid)) {
      this.userLiked.remove(user.uid);
    } else {
      this.userLiked.add(user.uid);
    }
  }

  void setId(DatabaseReference id) {
    this.sid = id;
  }

  Map<String, dynamic> toJson() {
    return {
      'author': this.author,
      'usersLiked': this.userLiked.toList(),
      'body': this.body
    };
  }
}
