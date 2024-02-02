import 'package:flutter/material.dart';

import 'dart:developer' as debug;
//import '../screens/entrance_widget.dart';
//import '../screens/single_post_widget.dart';

import '../main.dart';
import '../models/old_post.dart';
import '../models/samples_for_testing.dart';
import '../models/store_name_info.dart';
import '../models/utilities.dart';
import '../models/old_store.dart';
import 'normal_store_post_widget.dart';
import 'on_wait_widget.dart';
import 'page_navigation.dart';
import 'store_name_current_state_widget.dart';

typedef OnOpenChanged = Function(int indexOfOpenedStore);

class StoreNameInfoWidget extends StatefulWidget{

  StoreNameInfo storeNameInfo;
  int infoIndex;
  SampleForTesting sampleForTesting;
  OnOpenChanged onOpenChanged;

  
  bool hasJoined = false;

  StoreNameInfoWidget({
    super.key, 
    required this.storeNameInfo,
    required this.infoIndex,
    required this.sampleForTesting,
    required this.onOpenChanged,
  });

  @override 
  StoreNameInfoWidgetState createState()=> StoreNameInfoWidgetState();
}

class StoreNameInfoWidgetState extends State<StoreNameInfoWidget>{

  

  @override 
  void initState(){
    super.initState();

  }

  // This method is called before the build method.
  @override
  void didUpdateWidget(covariant StoreNameInfoWidget oldWidget) {
    
    super.didUpdateWidget(oldWidget);
    //widget.store = MyApplication.sampleForTesting.findStoreById(oldWidget.store.storeId!)!;
  }

  EdgeInsets storeHeadingPadding = const EdgeInsets.only(top: 5, bottom: 5, left:5);
  EdgeInsets storeHeadingMargin = const EdgeInsets.only(right: 10, bottom:5);

  EdgeInsets storeOpenCloseButtonPadding = const EdgeInsets.symmetric(vertical: 5);
  EdgeInsets storeOpenCloseButtonMargin = const EdgeInsets.only(right: 10, bottom:5);

  EdgeInsets storeJoinLeaveButtonPadding = const EdgeInsets.symmetric(vertical: 5);
  EdgeInsets storeJoinLeaveButtonMargin = const EdgeInsets.only(right: 10, bottom:5);

  double headingCircleRadius = 5;
  double headingTextFontSize = 15;

  //Color textColorOnButtonsAndMore = const Color.fromARGB(255, 245, 4, 193);
  Color textColorOnButtonsAndMore = const Color.fromARGB(169, 26, 2, 31);

  // Post Dialog Box.
  void displayPostDialog(BuildContext context, Store store) async {

    double fontSize = 15;
    String groupValue = '1';

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            
            return AlertDialog(
              title: const Center(child: Text('Choose Post Type', style: TextStyle(fontSize: 16),)),
              content: Container(
                height: 120,
                width: double.infinity,
                decoration: BoxDecoration(
                      color: MyApplication.scaffoldBodyColor,
                      borderRadius: const BorderRadius.all(Radius.circular(20))
                    ),
                child:Padding(
                  padding: const EdgeInsets.only(left:15),
                  child: Column(
                    children: [
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: GestureDetector(
                            onTap: () => setState((() => groupValue = '1')),
                            child: Row(
                              children: [
                                Expanded(
                                  flex:3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Create Past Post',
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        color: textColorOnButtonsAndMore,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Radio(
                                      value: '1', 
                                      groupValue: groupValue, 
                                      onChanged: ((value) { setState(() => groupValue = value!);}),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: GestureDetector(
                            onTap: () => setState((() => groupValue = '2')),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Create Future Post',
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        color: textColorOnButtonsAndMore,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Radio(
                                      value: '2', 
                                      groupValue: groupValue, 
                                      onChanged: ((value) { setState(() => groupValue = value!);}),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        child: SizedBox(
                          height: 40,
                          child: GestureDetector(
                            onTap: () => setState((() => groupValue = '3')),
                            child: Row(
                              children: [
                                Expanded(
                                  flex: 3,
                                  child: Align(
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      'Create Normal Post',
                                      style: TextStyle(
                                        fontSize: fontSize,
                                        color: textColorOnButtonsAndMore,
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.centerRight,
                                    child: Radio(
                                      value: '3', 
                                      groupValue: groupValue, 
                                      onChanged: ((value) { setState(() => groupValue = value!);}),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    
                    ],
                  ),
                ),
              ),
              backgroundColor: MyApplication.scaffoldColor,
              titleTextStyle: const TextStyle(
                color: Color.fromARGB(255, 245, 4, 193),
                fontSize: 20, 
                fontWeight: FontWeight.bold,
              ),
              contentTextStyle: const TextStyle(
                color:Colors.white, 
                fontSize: 14, 
                fontWeight: FontWeight.bold,
              ),
              actions: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {

                        Navigator.of(context).pop();
                      },
                      child: Container(
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                          color: MyApplication.scaffoldBodyColor,
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),

                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:10),
                            child: Text('Cancel', style: TextStyle(
                              color: const Color.fromARGB(255, 245, 4, 193),
                              fontSize:fontSize,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        
                        // Navigate To Create Past Store Post Page.
                        if(groupValue=='1'){

                        }
                        // Navigate To Create Future Store Post Page.
                        else if(groupValue=='2'){

                        }
                        // Navigate To Create Normal Store Post Page.
                        else{

                        }
                      },
                      child: Container(
                        width: 70,
                        height: 50,
                        decoration: BoxDecoration(
                          color: MyApplication.scaffoldBodyColor,
                          borderRadius: const BorderRadius.all(Radius.circular(20))
                        ),
                        
                        child: Center(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:10),
                            child: Text('Create', style: TextStyle(
                              color: const Color.fromARGB(255, 245, 4, 193),
                              fontSize:fontSize,
                              fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                
              ],
            );
          }
        );
      },
    );
  }


  @override 
  Widget build(BuildContext context){

    Store store = widget.sampleForTesting.findStoreById(widget.storeNameInfo.storeFK)!;

    double userImageRadius = 20;

    return Column(
    children: [
      // The 3 Elements Namely Store Name, Open/Close Button And The Join/Leave Button.
      Row(
        children: [
          // The Name Of A Store To Be Viewed.
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width*0.7,
              padding: storeHeadingPadding,
              margin: storeHeadingMargin,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(headingCircleRadius)),
                  color: MyApplication.headingColor,
                ),
              child: Text(widget.storeNameInfo.storeName,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  fontSize: headingTextFontSize,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  decoration: TextDecoration.none
                ),
              ),
            ),
          ),
          // The Button Responsible For Either Openning Or Closing The Store.
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: () { 
                if(widget.storeNameInfo.isOpened==false){
                  widget.onOpenChanged(widget.infoIndex);
                }
                else{
                  setState(() =>widget.storeNameInfo.isOpened = false);
                }
              },
            
              child: Container(
                width: MediaQuery.of(context).size.width*0.45,
                alignment: Alignment.center,
                padding: storeOpenCloseButtonPadding,
                margin: storeOpenCloseButtonMargin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(headingCircleRadius)),
                  color: MyApplication.headingColor,
                ),
                child: Text(widget.storeNameInfo.isOpened?'Close':'Open',
                  style: TextStyle(
                    fontSize: headingTextFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
          ),
          // The Button Responsible For Joining Or Leaving The Current Store.
          Expanded(
            flex: 1,
            child: GestureDetector(
              onTap: (() {
                // Take The User To The Login Page If He Or She Has Not Logged In.
                if(MyApplication.currentUser==null){
                  /*Navigator.of(context).push(
                    CustomPageRoute(
                      child: const EntranceWidget(
                        toPage: ToPage.postsWidget,
                      ),
                    ),
                  );*/
                }
                // Assuming The User Has Logged In.
                else{
                  // Remove The User From This Store.
                  if(widget.hasJoined){
                    /*
                    MyApplication.sampleForTesting.leaveStore(widget.store.storeId!, MyApplication.currentUser!.cellNumber);
                    setState(() {
                      hasJoined = !hasJoined;
                    });*/
                  }
                  // Add The User From This Store.
                  else{
                    /*MyApplication.sampleForTesting.joinStore(widget.store.storeId!, MyApplication.currentUser!.cellNumber);
                    setState(() {
                      hasJoined = !hasJoined;
                    });*/
                  }
                }
              }),
              child: Container(
                width: MediaQuery.of(context).size.width*0.45,
                alignment: Alignment.center,
                padding: storeJoinLeaveButtonPadding,
                margin: storeJoinLeaveButtonMargin,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(headingCircleRadius)),
                  color: MyApplication.headingColor,
                ),
                child: Text(widget.hasJoined?'Leave':'Join',
                  style: TextStyle(
                    fontSize: headingTextFontSize,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    decoration: TextDecoration.none
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      
      widget.storeNameInfo.isOpened? Column(
        children: [
          // Current Store State
          StoreNameInfoCurrentStateWidget(
            store:widget.sampleForTesting.findStoreById(widget.storeNameInfo.storeFK)!, 
            sampleForTesting: widget.sampleForTesting,
          ),
          // Store Post Managememnt
          Row(

            children: [
              // Current User Image
              Expanded(
                child: Center(
                  child: CircleAvatar(
                    radius: userImageRadius,
                    backgroundColor: Colors.orange,
                    backgroundImage: AssetImage(
                      MyApplication.currentUser==null?
                      'assets/users/players/1.jpg':
                      MyApplication.currentUser!.findImageLocation()
                    ),
                    /*backgroundImage: NetworkImage(
                      widget.wonPrice.competition.winner!.findImageLocation(),
                    ),*/
                  ),
                ),
              ),
              // Create/Choose Post Button
              Expanded(
                flex: 3,
                child: Container(
                  height: 40,
                  decoration: BoxDecoration(
                    color: MyApplication.scaffoldColor,
                    borderRadius: const BorderRadius.all(
                        Radius.circular(10),
                      ),
                  ),
                  child: Align(
                    child: GestureDetector(
                      onTap: (() {
                        displayPostDialog(context, store);
                      }),
                      child: Text('Create Post', 
                        style: TextStyle(
                          color: MyApplication.headingColor,
                          fontSize: MyApplication.infoTextFontSize,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              // Pick Image Icon
              Expanded(
                child: GestureDetector(
                  onTap: (() {
                    debug.log('Let Me Pick A Picture To Post.');
                  }),
                  child: IconButton(
                    icon: const Icon(Icons.image_search),
                    iconSize: 40,
                    color: Colors.white,
                    onPressed: (() {
                      
                    }),
                  ),
                ),
              ),
            ],
          ),
          // All Store Posts
          NormalStorePostWidget(normalStorePost:SampleForTesting.allRegisteredNormalStorePosts[0]),
          
          /*
          Column(
            children: [
              Row(
                children: [
                  // Currently Logged In User's Image And Username.
                  Expanded(
                    flex: 3,
                    child: Row(
                      children: [
                        // Currently Logged In User Image.
                        Center(
                          child: CircleAvatar(
                            radius: 50,
                            backgroundColor: Colors.orange,
                            backgroundImage: AssetImage(
                              MyApplication.currentUser!.findImageLocation(),
                            ),
                            /*backgroundImage: NetworkImage(
                              widget.wonPrice.competition.winner!.findImageLocation(),
                            ),*/
                          ),
                        ),
                        
                        Column(
                          children: [
                            // Currently Logged In User Username
                            SizedBox(
                              width:MediaQuery.of(context).size.width*0.6,
                              child: Text(
                                MyApplication.currentUser!.username, 
                                style: TextStyle(
                                  fontSize: MyApplication.infoTextFontSize,
                                  fontWeight: FontWeight.bold
                                )
                              ),
                            ),
                            // How Long Since The Post Is Published
                            const Text('1 week', style: TextStyle(fontSize: 8, color: Colors.grey))
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Buttom For More Action Regarding This Post.
                  Expanded(
                    flex: 1,
                    child: IconButton(
                      icon: const Icon(Icons.more_horiz),
                      iconSize: 30,
                      color: Colors.grey,
                      onPressed: (() {
                        
                      }),
                    ),
                  ),
                ],
              )
            ],
          ),*/
          
        ]
      )
        
      :const SizedBox.shrink(),
      // The Portion Where All The Posts About This Store Reside.
      //isOpen? Expanded(child: SinglePostWidget(store: widget.store)):const SizedBox.shrink(),
    ],
  );
}


}

