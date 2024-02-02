import 'package:flutter/material.dart';

import '../main.dart';
import '../models/samples_for_testing.dart';


class CommunicationScreen extends StatefulWidget{


  CommunicationScreen({
    super.key,
    });


  @override 
  _CommunicationScreenState createState()=>_CommunicationScreenState();
}

class _CommunicationScreenState extends State<CommunicationScreen>{
  

  _CommunicationScreenState();

  @override 
  void initState(){
    super.initState();

  }
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
      color: MyApplication.scaffoldBodyColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30), 
        topRight: Radius.circular(30),
      ),
    ),
      child: const Center(
        child: Text('CommunicationScreen', 
          style: TextStyle(
            fontSize: 50,
          )
        ),
      ),
    );
  }
}