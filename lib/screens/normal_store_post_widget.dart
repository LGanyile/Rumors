import 'package:flutter/material.dart';
import '../main.dart';
import '../models/normal_store_post.dart';

import 'store_post_widget.dart';

import 'dart:developer' as debug;

class NormalStorePostWidget extends StorePostWidget{

  NormalStorePost normalStorePost;

  NormalStorePostWidget({
    required this.normalStorePost,
  });

  @override
  State<StatefulWidget> createState() => NormalStorePostWidgetState();

  
  buildPostHeading(BuildContext context, 
  String creatorImageLocation, String creatorUsername){
    super.createStorePostHeading(context, creatorImageLocation, creatorUsername);
  }

  Row retrievePostHeading()=>super.postHeading;
  
}

class NormalStorePostWidgetState extends State<NormalStorePostWidget>{

  double findPostBodyHeight(String postAsText){

    double containerHeight;
    double screenWidth = MediaQuery.of(context).size.width;
    int singleLineMaxNoOfCharacters = screenWidth~/9;

    if(postAsText.length>singleLineMaxNoOfCharacters){
      containerHeight = 18 * (postAsText.length/singleLineMaxNoOfCharacters);
        
    }
    else{
      containerHeight = 18;
    }
    return containerHeight;
  }


  @override
  Widget build(BuildContext context) {

    widget.buildPostHeading(context, 
    widget.normalStorePost.creatorImageLocation, 
    widget.normalStorePost.creatorUsername,
    );

    Container postBodyContainer;

    String? postAsText = widget.normalStorePost.text;
    String? postAsVideoOrImage = widget.normalStorePost.videoOrImageLocation;
    double containerHeight;
    double containerWidth = MediaQuery.of(context).size.width*0.9;

    // Post Is Made Up Of Text Only.
    if(postAsText != null && postAsVideoOrImage==null){
      postBodyContainer = Container(
        height: findPostBodyHeight(postAsText),
        width: containerWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        // Does Not Enables One To See More Text If It Too Big To Fit.
        child: Text(postAsText, 
          style: TextStyle(
            fontSize: MyApplication.infoTextFontSize,
          ),
        ),
      );
    }
    // Post Is Made Up Of Video Or Image Only.
    else if(postAsText == null && postAsVideoOrImage!=null){
      
      containerHeight = containerWidth;

      postBodyContainer = Container(
        height: containerHeight,
        width: containerWidth,
        decoration: const BoxDecoration(
          color: Colors.white,
        ),
        // Does Not Allow Multiple Images.
        child: Image.asset(postAsVideoOrImage),
        
      );
    }
    // Post Is Made Up Of Both The Text And The Video Or Image.
    else if(postAsText != null && postAsVideoOrImage!=null){

      double textContainerHeihgt = findPostBodyHeight(postAsText);
      double imageOrVideoContainerHeight = containerWidth;

      Column column = Column(
        children: [
          // Post Text Part
          Container(
            height: textContainerHeihgt,
            width: containerWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            // Does Not Enables One To See More Text If It Too Big To Fit.
            child: Text(postAsText, 
              style: TextStyle(
                fontSize: MyApplication.infoTextFontSize,
              ),
            ),
          ),
          // Post Image Part
          Container(
            height: imageOrVideoContainerHeight,
            width: containerWidth,
            decoration: const BoxDecoration(
              color: Colors.white,
            ),
            // Does Not Allow Multiple Images.
            child: Image.asset(postAsVideoOrImage),
            
          ),
        ],
      );

      postBodyContainer = Container(
        height: textContainerHeihgt + imageOrVideoContainerHeight + 10,
        child:column,
      );
    }
    // There Is No Body For The Post.
    else{
      postBodyContainer = Container(
        height: 20,
        child: const Center(child: Text('No Post', style: TextStyle(fontSize: 16))),
      );
    }

    return Column(
      children: [
        widget.retrievePostHeading(),
        postBodyContainer,
      ],
    );
  }

}