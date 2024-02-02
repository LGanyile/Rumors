import 'package:flutter/material.dart';

import '../main.dart';

class DrinksScreen extends StatefulWidget{


DrinksScreen({
    super.key,
    });

  @override 
  _DrinksScreenState createState()=>_DrinksScreenState();
}

class _DrinksScreenState extends State<DrinksScreen>{

  @override 
  void initState(){
    super.initState();
  }

  @override 
  Widget build(BuildContext context)=>Container(
    decoration: BoxDecoration(
      color: MyApplication.scaffoldBodyColor,
      borderRadius: const BorderRadius.only(
        topLeft: Radius.circular(30), 
        topRight: Radius.circular(30),
      ),
    ),
    child: const Center(
      child: Text('DrinksScreen', 
      style: TextStyle(fontSize: 50,)
      )
    )
  );
}