import 'store_post.dart';

class NormalStorePost extends StorePost{

  String? text;
  String? videoOrImageLocation;
  
  NormalStorePost({
    required this.text,
    required this.videoOrImageLocation,
    required storePostId,
    required storeGroupFK,
    required creatorUserId,
    required creatorImageLocation,
    required creatorUsername,
    createdDate,
  }):super(
    storePostId: storePostId,
    storeGroupFK: storeGroupFK,
    creatorUserId: creatorUserId,
    creatorImageLocation: creatorImageLocation,
    creatorUsername: creatorUsername,
    createdDate: createdDate
  );

  factory NormalStorePost.fromJson(dynamic json){
    return NormalStorePost(
      text: json['Text'],
      videoOrImageLocation: json['Video Or Image Location'],
      storePostId: json['Store Post Id'],
      storeGroupFK: json['Store Group Post FK'],
      creatorUserId: json['Store Post Creator Id'],
      creatorImageLocation: json['Store Post Creator Image Location'],
      creatorUsername: json['Store Post Creator Username'],
      createdDate: json['Store Post Created Date'],
    );
  }

  @override 
  String toString(){
    return 'Normal Post => Store Post Id: $storePostId Store Group FK: $storeGroupFK '
    'Text: $text Video Or Image Location: $videoOrImageLocation '
    'Creator User Id: $creatorUserId Creator Username: $creatorUsername '
    'Creator Image Location: $creatorImageLocation Date Created: $createdDate';
  }

}