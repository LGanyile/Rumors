import 'package:flutter/material.dart';

class NoCompetitionWidget extends StatelessWidget{
  @override
  Widget build(BuildContext context) => const Center(
    child: Text('Store Has No Competitions Yet', 
      style: TextStyle(
        fontSize: 40,
      ),
    ),
  );

}