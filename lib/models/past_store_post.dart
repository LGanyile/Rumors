import 'store_post.dart';

class PastStorePost extends StorePost{
  
  String whatWereYouDrinkingVideoClipImageOrVoiceClipLocation; // 5 seconds video
  String whereWereYouVideoClipImageOrVoiceClipLocation; // 5 seconds video or pic
  String whatMusicWereYouListeningToClipLocation; // 10-15 seconds track.
  String whatHappenedTextDescriptionVideoClipImageOrVoiceClipLocaiton; // voice record takes a max of 35 seconds.

  // Has a sub collection of store_post_involved_users 
  // This is a list of users who were there 
  // during good time not neccessarily ones alcoholics.

  PastStorePost({
    required storePostId,
    required storeGroupFK,
    required creatorUserId,
    required creatorImageLocation,
    required creatorUsername,
    createdDate,

    required this.whatWereYouDrinkingVideoClipImageOrVoiceClipLocation,
    required this.whereWereYouVideoClipImageOrVoiceClipLocation,
    required this.whatMusicWereYouListeningToClipLocation,
    required this.whatHappenedTextDescriptionVideoClipImageOrVoiceClipLocaiton,
  }):super(
    storePostId: storePostId,
    storeGroupFK: storeGroupFK,
    creatorUserId: creatorUserId,
    creatorImageLocation: creatorImageLocation,
    creatorUsername: creatorUsername,
    createdDate: createdDate
  );

  @override 
  Map<String, dynamic> toJson(){
    Map<String, dynamic> map = super.toJson();

    map.addAll(
      {
      
      'What Were You Drinking Video Clip Image Or Voice Clip Location': 
      whatWereYouDrinkingVideoClipImageOrVoiceClipLocation,

      'Where Were You Video Clip Image Or Voice Clip Location': 
      whereWereYouVideoClipImageOrVoiceClipLocation,

      'What Music Were You Listening To Clip Location': 
      whatMusicWereYouListeningToClipLocation,

      'What Happened Text Description Video Clip Image Or Voice Clip Locaiton': 
      whatHappenedTextDescriptionVideoClipImageOrVoiceClipLocaiton,
      
      }
    );

    return map;
  }

  factory PastStorePost.fromJson(dynamic json){
    return PastStorePost(
      storePostId: json['Store Post Id'],
      storeGroupFK: json['Store Group Post FK'],

      whatWereYouDrinkingVideoClipImageOrVoiceClipLocation: 
      json['What Were You Drinking Video Clip Image Or Voice Clip Location'],

      whereWereYouVideoClipImageOrVoiceClipLocation: 
      json['Where Were You Video Clip Image Or Voice Clip Location'],
      
      whatMusicWereYouListeningToClipLocation: 
      json['What Music Were You Listening To Clip Location'],

      whatHappenedTextDescriptionVideoClipImageOrVoiceClipLocaiton: 
      json['What Happened Text Description Video Clip Image Or Voice Clip Locaiton'],

      creatorUserId: json['Store Post Creator Id'],
      creatorImageLocation: json['Store Post Creator Image Location'],
      creatorUsername: json['Store Post Creator Username'],
      createdDate: json['Store Post Created Date'],
    );

    
  }

  @override 
  String toString(){
    return 'Past Post => Store Post Id: $storePostId Store Group FK: $storeGroupFK '
    'Drinks: $whatWereYouDrinkingVideoClipImageOrVoiceClipLocation '
    'Location: $whereWereYouVideoClipImageOrVoiceClipLocation '
    'Music: $whatMusicWereYouListeningToClipLocation '
    'Happened: $whatHappenedTextDescriptionVideoClipImageOrVoiceClipLocaiton'
    'Creator User Id: $creatorUserId Creator Username: $creatorUsername '
    'Creator Image Location: $creatorImageLocation Date Created: $createdDate';
  }


}
