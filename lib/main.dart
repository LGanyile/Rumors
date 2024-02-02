import 'package:flutter/material.dart';

import 'models/samples_for_testing.dart';
import 'models/old_user.dart';
import 'screens/on_play_widget.dart';
import 'screens/on_wait_widget.dart';
import 'screens/start_screen.dart';
import 'screens/store_info_widget.dart';
import 'screens/store_name_info_widget.dart';
import 'screens/stores_widget.dart';
import 'screens/winner_widget.dart';


void main() {
  runApp(MyApplication());

}


class MyApplication extends StatefulWidget {
  
  MyApplication({super.key});

  static String title = 'Alcoholic';
  final SampleForTesting sampleForTesting = SampleForTesting();

  static EdgeInsets storeDataPadding = const EdgeInsets.only(left: 20, right: 20, top:10);

  
  
  static Color scaffoldColor = const Color.fromARGB(240, 23, 212, 212);

  static Color scaffoldBodyColor = const Color.fromARGB(255, 173, 235, 229);
  

  static LinearGradient priceslinearGradient = const LinearGradient(
  colors: [Colors.white, Color.fromARGB(255, 44, 35, 46)],
  begin: Alignment.bottomLeft,end: Alignment.topRight,);

  static Color textColor = const Color.fromARGB(255, 154, 46, 173);
  static double infoTextFontSize = 15;

  //static Color storeInfoTextColor = Colors.lightBlue;
  static Color storeInfoTextColor = const Color.fromARGB(169, 27, 3, 114);

  //static Color headingColor = const Color.fromARGB(169, 106, 3, 124);
  static Color headingColor = const Color.fromARGB(169, 27, 3, 114);

  static String userPhoneNumber = '';

  static User? currentUser;

  static BoxDecoration userThoughtsAreaDecoration = const BoxDecoration(
  color: Color.fromARGB(255, 190, 183, 209),borderRadius: 
  BorderRadius.only(topLeft: Radius.circular(30),topRight: 
  Radius.circular(30),));

  static BoxDecoration userThoughtsDecoration = const BoxDecoration(
  color: Color.fromARGB(255, 182, 142, 189),borderRadius: 
  BorderRadius.only(bottomRight: Radius.circular(20),topRight: 
  Radius.circular(20),));

  static TextStyle usernameStyle = const TextStyle(
  color: Colors.grey, fontSize: 15,fontWeight: FontWeight.bold,);

  static TextStyle userMessageStyle = const TextStyle(
  color: Colors.blueGrey, fontSize: 15,fontWeight: FontWeight.w600,);

  static double playCompetitionIconFontSize = 75;
  static double alarmIconFontSize = 70;



  @override
  State<MyApplication> createState() => _MyApplicationState();
}

class _MyApplicationState extends State<MyApplication> {

  @override
  void initState() {
    // This method execute only when this state is created for the first time.
    // It get executed befor the build method.
    super.initState();
    
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Alcoholic',
      /*theme: ThemeData(
        primaryColor: const Color.fromARGB(115, 231, 195, 214),
        secondaryHeaderColor: const Color.fromARGB(115, 231, 195, 214),
      ),*/
      home: StartScreen(sampleForTesting: widget.sampleForTesting),
      //home: StoreInfoWidget(store:SampleForTesting.allRegisteredStores[0]),
      //home: OnPlayWidget(store:SampleForTesting.allRegisteredStores[0]),
      //home: OnWaitWidget(store:SampleForTesting.allRegisteredStores[0], sampleForTesting: widget.sampleForTesting,),
      //home: StoresWidget(sampleForTesting: widget.sampleForTesting,),
      //home: WinnerWidget(wonPrice: SampleForTesting.allRegisteredWonPrices[0],/*SampleForTesting.allRegisteredStores[0].lastWonPrice!*/)
    );

    
    
  }
}