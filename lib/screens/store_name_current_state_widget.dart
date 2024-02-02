import 'dart:developer' as debug;
import 'package:flutter/material.dart';
import 'package:rumors/models/samples_for_testing.dart';

import 'no_competition_widget.dart';
import 'on_play_widget.dart';
import 'on_wait_widget.dart';
import '../screens/winner_widget.dart';
import '../models/old_competition.dart';
import '../models/old_store.dart';

class StoreNameInfoCurrentStateWidget extends StatefulWidget{

  Store store;
  SampleForTesting sampleForTesting;

  StoreNameInfoCurrentStateWidget({
    super.key, 
    required this.store,
    required this.sampleForTesting
  });

  @override  
  StoreNameInfoCurrentStateWidgetState createState()=>StoreNameInfoCurrentStateWidgetState();

}

class StoreNameInfoCurrentStateWidgetState extends State<StoreNameInfoCurrentStateWidget>{
  

  StoreNameInfoCurrentStateWidgetState();

  int _findSpecialDateIndex(){

    for(int i = 0; i < widget.store.competitions.length;i++){
      if(widget.store.competitions[i].dateTime.year==DateTime.now().year &&
      widget.store.competitions[i].dateTime.month==DateTime.now().month &&
      widget.store.competitions[i].dateTime.day==DateTime.now().day){
        return i;
      }
    }
    return -1;
  }

  @override 
  Widget build(BuildContext context)=> displayApproriatePage();
  
  Widget displayApproriatePage(){

    int specialDateIndex = _findSpecialDateIndex();
    DateTime now = DateTime.now();

    
    
    // There is no competition to be watched today.
    if(specialDateIndex<0){

      
      Competition? prevCompetition = widget.store.findPrevCompetition(now);
      Competition? nextCompetition = widget.store.findNextCompetition(now);

      // Either Show The Previous Or Comming Competition.
      if(prevCompetition != null && nextCompetition != null){
        
        Duration halfOfDifferenceInSeconds = Duration(seconds: 
        widget.store.findTimeDifferenceInSeconds(
        prevCompetition, nextCompetition)~/2).abs();

        DateTime middleDate = prevCompetition.dateTime.add(halfOfDifferenceInSeconds);
        Duration timePassedSincePrevCompetitionDate  = prevCompetition.dateTime.difference(DateTime.now()).abs();
        
        if(prevCompetition.dateTime.add(timePassedSincePrevCompetitionDate).isAfter(middleDate)){
          return OnWaitWidget(store:widget.store, sampleForTesting: widget.sampleForTesting, 
          competition:nextCompetition);
        }
        else{
          return WinnerWidget(wonPrice: widget.store.lastWonPrice!);
        }
      }

      // There Was A Competition/Draw But It Time Has Passed.
      // Now Show The Last Won Price.
      // Assuming There Is Only One Competition On A Given Day.
      else if(nextCompetition == null && prevCompetition != null){
        return WinnerWidget(wonPrice: widget.store.lastWonPrice!);
      }
      // The draw is comming soon.
      else if(nextCompetition != null && prevCompetition == null){
        return OnWaitWidget(store:widget.store, sampleForTesting: widget.sampleForTesting,competition:nextCompetition);
      }
      else{
        return NoCompetitionWidget();
      }
      
    }
    
    // There is a competition to be watched today.
    else{
      Competition competition = widget.store.competitions[specialDateIndex];
      
      // The Draw/Competition Is Currently Playing.
      if(now.isAfter(competition.dateTime) && 
      now.isBefore(competition.dateTime.add(competition.duration!)) ){
        
        return OnPlayWidget(store:widget.store);
      }

      else if(now.isAfter(competition.dateTime.add(competition.duration!))){
        return WinnerWidget(wonPrice: widget.store.lastWonPrice!);
      }

      
      // The searched store name exist and the draw is about to begin.
      // A countdown clock needs to be display until the draw begins,
      // in which chase it will disappear.
      else{
        return OnWaitWidget(store:widget.store, sampleForTesting: widget.sampleForTesting,competition:competition);
      }
      
    }
  }

}