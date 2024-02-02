import 'dart:math';

import 'old_comment.dart';
import 'old_user.dart';

class Post extends Comparable<Post>{
  String storeFK;
  String text;
  User owner;
  DateTime? time;
  List<Comment> comments;
  String? postId;
  
  Post({
    required this.storeFK,
    required this.owner,
    required this.text,
    this.postId,
    this.time,
    this.comments = const[],
  }){
    generatePostId();
    time = DateTime.now();
  }

  Map<String, dynamic> toJson(){
    return {
      'Store FK': storeFK,
      'Post Owner': owner.toJson(),
      'Post Text': text,
      'Post Time': DateTime.now().toString(),
      'Post Comments': comments,
      'Post Id': postId,
    };
  }

  factory Post.fromJson(dynamic json){
    return Post(
      storeFK: json['Store FK'],
      owner: json['Post Owner'],
      text: json['Post Text'],
      postId: json['Post Id'],
      time: json['Post Time'],
      comments: json['Post Comments'],
    );
  }

  @override 
  String toString(){
    String description = 'Post Id: $postId Store FK: $storeFK Post Comment: $text Poster Owner Image: ${owner.findImageLocation()} '
    'Post Date: $time Comments: [';

    for(Comment comment in comments){
      description += '$comment ';
    }
    description += ']';
    
    return description;
  }

  void generatePostId(){

    if(this.postId!=null){
      return;
    }
    String lettersAndNumbers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';

    String postId = '';

    for(int i = 0; i < 10;i++){
      Random random = Random();
      postId += lettersAndNumbers[random.nextInt(lettersAndNumbers.length)];
    }

    this.postId = postId;
    
  }
  
  @override
  int compareTo(Post other) {
    return time!.compareTo(other.time!);
  }
}