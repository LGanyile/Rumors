import 'dart:math';

import 'utilities.dart';

class Alcohol implements Comparable<Alcohol>{

  String? alcoholId;
  String fullname;
  String volume;
  String alcoholPercent;
  String imageLocation;
  double price;
  AlcoholType alcoholType;


  Alcohol({
    this.alcoholId,
    required this.fullname,
    required this.volume,
    required this.alcoholPercent,
    required this.imageLocation,
    required this.price,
    required this.alcoholType,
  }){
    generateStoreId();
  }

  Map<String,dynamic> toJson(){
    generateStoreId();
    return {
      'Alcohol Id': alcoholId,
      'Full Name': fullname,
      'Volume': volume,
      'Alcohol Percent': alcoholPercent,
      'Image Location': imageLocation,
      'Price': price,
      'Type': alcoholType,
    };
  }

  factory Alcohol.fromJson(dynamic json){
    
    return Alcohol(
      alcoholId: json['Alcohol Id'],
      fullname: json['Full Name'], 
      volume: json['Volume'], 
      alcoholPercent: json['Alcohol Percent'],
      imageLocation: json['Image Location'],
      price: json['Price'],
      alcoholType: json['Type'],
    );
  }

  @override 
  String toString(){
    generateStoreId();
    return 'Alcohol Type: $alcoholType Name: $fullname '
    'Volume: $volume Id: $alcoholId Percent: $alcoholPercent '
    'Price: $price Image Location: $imageLocation';
  }

  void generateStoreId(){

    if(this.alcoholId!=null){
      return;
    }
    String lettersAndNumbers = 'abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890';

    String alcoholId = '';

    for(int i = 0; i < 20;i++){
      Random random = Random();
      alcoholId += lettersAndNumbers[random.nextInt(lettersAndNumbers.length)];
    }

    this.alcoholId = alcoholId;
  }
  
  @override
  int compareTo(Alcohol other) {
    return fullname.compareTo(other.fullname);
  }
}