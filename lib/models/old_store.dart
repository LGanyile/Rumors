import 'dart:math';

import 'alcohol.dart';
import 'future_store_post.dart';
import 'graph theory/utilities.dart';
import 'graph theory/section_name.dart';
import 'normal_store_post.dart';
import 'old_player.dart';
import 'old_post.dart';
import 'old_competition.dart';
import 'old_user.dart';
import 'old_won_price.dart';
import 'past_store_post.dart';

// Last Won Member Is Tracked Using A Method As Opposed To An Attribute.
class Store extends Comparable<Store>{
  String? storeId;
  String storeName;
  String picPath;
  String picName;
  String address;
  User? storeOwner;
  SectionName sectionName;
  List<Competition> competitions;

  List<Post> posts;
  List<NormalStorePost> normalStorePosts;
  List<PastStorePost> pastStorePosts;
  List<FutureStorePost> futureStorePosts;


  Map<Player, String> joinedMembers;
  List<Alcohol> availableAlcohol;
  WonPrice? lastWonPrice;

  Store({
    this.storeOwner,
    required this.storeName,
    required this.picPath,
    required this.picName,
    required this.address,
    required this.sectionName,
    required this.competitions,

    required this.posts,
    required this.normalStorePosts,
    required this.futureStorePosts,
    required this.pastStorePosts,

    this.storeId,
    this.joinedMembers = const{},
    this.availableAlcohol = const [],
    
  }){
    generateStoreId();
  }

    Map<String,dynamic> toJson(){
      generateStoreId();
    return {
      'Store Owner': storeOwner!.toJson(),
      'Store Name': storeName,
      'Store Pic Path': picPath,
      'Store Pic Name': picName,
      'Store Address': address,
      'Store Competitions': competitions,
      'Store Posts': posts,
      'Normal Store Posts': normalStorePosts,
      'Past Store Posts': pastStorePosts,
      'Future Store Posts': futureStorePosts,
      'Store Id': storeId,
      'Store\'s Last Won Price': lastWonPrice!.toJson(),
      'Store Joined Members': joinedMembers,
      'Store\'s Section/Area': Utilities.asString(sectionName),
      'Store\'s Alcohol': availableAlcohol,
    };
  }

  factory Store.fromJson(dynamic json){
    return Store(
      storeOwner: json['Storew Owner'],
      storeName: json['Store Name'], 
      picPath: json['Store Pic Path'], 
      picName: json['Store Pic Name'], 
      address: json['Store Address'],
      sectionName: json['Store\'s Section/Area'],
      competitions: json['Store Competitions'],
      posts: json['Store Posts'],
      normalStorePosts: json['Normal Store Posts'],
      futureStorePosts: json['Future Store Posts'],
      pastStorePosts: json['Past Store Posts'],
      storeId: json['Store Id'],
      joinedMembers: json['Store Joined Members'],
      availableAlcohol: json['Store\'s Alcohol'],
    );
  }

  Competition? findPrevCompetition(DateTime now){

    Competition? prevCompetition;
    int competitionIndex;
    for(competitionIndex = 0; competitionIndex < competitions.length;competitionIndex++){
      if(competitions[competitionIndex].dateTime.isBefore(now)){
        prevCompetition = competitions[competitionIndex];
      }
    }

    return prevCompetition;
  }

  Competition? findNextCompetition(DateTime now){
    
    Competition? nextCompetition;
    for(int competitionIndex = competitions.length-1; competitionIndex >= 0;competitionIndex--){
      if(competitions[competitionIndex].dateTime.isAfter(now)){
        nextCompetition = competitions[competitionIndex];
      }
    }

    return nextCompetition;
    
  }

  int findTimeDifferenceInSeconds(Competition prevCompetition, Competition nextCompetition){

    Duration duration = prevCompetition.dateTime.difference(nextCompetition.dateTime);
    return duration.inSeconds;
  }

  @override 
  String toString(){
    generateStoreId();
    return 'Store Name: $storeName Store Address: $address '
    'Section Name: $sectionName Store Pic Path: $picPath '
    'Store Pic Name: $picName Store Id: $storeId Store Owner: $storeOwner ';
  }

  void generateStoreId(){

    if(this.storeId!=null){
      return;
    }
    String lettersAndNumbers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';

    String storeId = '';

    for(int i = 0; i < 20;i++){
      Random random = Random();
      storeId += lettersAndNumbers[random.nextInt(lettersAndNumbers.length)];
    }

    this.storeId = storeId;
  }

  
  
  @override
  int compareTo(Store other) {
    return storeName.compareTo(other.storeName);
  }

  bool hasJoined(String cellNumber){
    for(User user in joinedMembers.keys){
      if(user.cellNumber==cellNumber){
        return true;
      }
    }

    return false;
  }

  

  Competition? findNextCloseCompetition(DateTime after){
    competitions.sort();

    Competition? competition;
    int competitionIndex = 0;
    while(competitions[competitionIndex].dateTime.isBefore(after)){
      competition = competitions[competitionIndex++];
    }
    return competition;
  }

  

}