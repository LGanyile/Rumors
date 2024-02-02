import 'dart:developer' as debug;
import 'package:flutter/material.dart';

import '../main.dart';
import '../models/samples_for_testing.dart';
import 'store_info_widget.dart';
import '../models/old_competition.dart';
import 'competition_screen_helper.dart';

class OnWaitWidget extends StoreInfoWidget{

  SampleForTesting sampleForTesting;
  Competition competition;

  OnWaitWidget({super.key, 
    required store,
    required this.competition,
    required this.sampleForTesting,
  }):super(store:store);

  @override
  State createState() =>OnWaitWidgetState();

  

  Widget remainingTime(DateTime specialDate){
    
    DateTime justNow = DateTime.now();
    int newHours = specialDate.hour,  
    newMinutes = specialDate.minute, 
    newSeconds = specialDate.second;

    if(specialDate.second>=justNow.second){
      newSeconds = specialDate.second-justNow.second;
    }
    else{
      if(specialDate.minute>0){
        newMinutes--;
      }
      else{
        newHours--;
        newMinutes = 59;
      }
      newSeconds = specialDate.second + 60 - justNow.second;  
    }

    DateTime newDate = DateTime(
        specialDate.year, 
        specialDate.month, 
        specialDate.day, 
        newHours-justNow.hour, 
        newMinutes-justNow.minute,
        newSeconds-justNow.second,
      );

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 40),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Remaining Time',
            style: TextStyle(
              fontSize: MyApplication.infoTextFontSize,
              color: MyApplication.storeInfoTextColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
            ),
          ),
          Text(
            '${newDate.hour}:${newDate.minute}:${newDate.second}',
            style: TextStyle(
              fontSize: MyApplication.infoTextFontSize,
              color: MyApplication.storeInfoTextColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none
            ),
          ),
        ],
      ),
    );
  }

}



class OnWaitWidgetState extends State<OnWaitWidget>{

  @override
  Widget build(BuildContext context) {
    
    Column detailsColumn = widget.retrieveStoreDetails(context);
    
    detailsColumn.children.add(widget.remainingTime(widget.competition.dateTime));

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical:20),
          child: widget.retrieveStoreImage(context),
        ),
        detailsColumn,
        _buildGrandPrices(),
      ]
    );
  }
  
  Widget _buildGrandPrices(){

    Widget grid;

    double horizontalGrandPriceSpaceces = 10;

    switch(widget.competition.maxNoOfGrandPrices){
      case 4:
        grid = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 0),
                    const Expanded(child:SizedBox.shrink()),
                    // Top Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 1),
                  ],
                ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Alarm
                  Expanded(
                    child: IconButton(
                      onPressed: ()=>{
                        // Add Alarm So That A User Will Be Informed When The Draw/Competition Begins.
                        debug.log('Alarm Will Go On At ...')
                      }, 
                      icon: Icon(
                        Icons.add_alarm,
                        size: MyApplication.alarmIconFontSize,
                      ),
                    ),
                  ),
                ],
              ), 
            Padding(
              padding: EdgeInsets.only(bottom:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Bottom Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 2),
                    const Expanded(child:SizedBox.shrink()),
                    // Bottom Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 3),
                  ],
                ),
            ),
          ],
        );
        break;
      case 5:
        grid = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 0),
                    // Alarm
                    Expanded(
                      child: IconButton(
                        onPressed: ()=>{
                          // Add Alarm So That A User Will Be Informed When The Draw/Competition Begins.
                          debug.log('Alarm Will Go On At ...')
                        }, 
                        icon: Icon(
                          Icons.add_alarm,
                          size: MyApplication.alarmIconFontSize,
                        ),
                      ),
                    ),
                    // Top Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 1),
                  ],
                ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Middle Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 2),
                ],
              ),           
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Bottom Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 3),
                    const Expanded(child:SizedBox.shrink()),
                    // Bottom Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 4),
                  ],
                ),
            ),
          ],
        );
        break;
      case 6:
        grid = Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces, bottom:horizontalGrandPriceSpaceces),
              child: Row(

                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 0),
                    // Alarm
                    Expanded(
                      child: Center(
                        child: IconButton(
                          onPressed: ()=>{
                            // Add Alarm So That A User Will Be Informed When The Draw/Competition Begins.
                            debug.log('Alarm Will Go On At ...')
                          }, 
                          icon: Icon(
                            Icons.add_alarm,
                            size: MyApplication.alarmIconFontSize,
                          ),
                        ),
                      ),
                    ),   
                    // Top Right Grand Price.
                    CompetitionScreenHelper(alignmentGeometry: Alignment.centerRight, isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 1),
                  ],
                ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Middle Left Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 2),
                  const Expanded(child:SizedBox.shrink()),
                  // Middle Right Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 3),
                ],
              ),           
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces, bottom:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Bottom Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 4),
                    const Expanded(child:SizedBox.shrink()),
                    // Bottom Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 5),
                  ],
                ),
            ),
          ],
        );
        break;
      case 7:
        grid = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces, bottom:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 0),
                    // Alarm
                    Expanded(
                      child: IconButton(
                        onPressed: ()=>{
                          // Add Alarm So That A User Will Be Informed When The Draw/Competition Begins.
                          debug.log('Alarm Will Go On At ...')
                        }, 
                        icon: Icon(
                          Icons.add_alarm,
                          size: MyApplication.alarmIconFontSize,
                        ),
                      ),
                    ),
                    // Top Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 1),
                  ],
                ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Middle Left Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 2),
                  // Middle Right Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 3),
                  // Middle Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 4),
                ],
              ),           
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces, bottom:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Bottom Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 5),
                    const Expanded(child:SizedBox.shrink()),
                    // Bottom Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 6),
                  ],
                ),
            ),
          ],
        );
        break;
      case 8:
        grid = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces, bottom:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 0),
                    // Top Middle Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 1),
                    // Top Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 2),
                  ],
                ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Middle Right Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 3),
                  // Alarm
                  Expanded(
                    child: IconButton(
                      onPressed: ()=>{
                        // Add Alarm So That A User Will Be Informed When The Draw/Competition Begins.
                        debug.log('Alarm Will Go On At ...')
                      }, 
                      icon: Icon(
                        Icons.add_alarm,
                        size: MyApplication.alarmIconFontSize,
                      ),
                    ),
                  ),
                  // Middle Left Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 4),
                ],
              ),           
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces, bottom:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Bottom Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 5),
                    // Middle Bottom Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 6),
                    // Bottom Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 7),
                  ],
                ),
            ),
          ],
        );
        break;
      default:
        grid = Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // Alarm
                  Expanded(
                    child: IconButton(
                      onPressed: ()=>{
                        // Add Alarm So That A User Will Be Informed When The Draw/Competition Begins.
                        debug.log('Alarm Will Go On At ...')
                      }, 
                      icon: Icon(
                        Icons.add_alarm,
                        size: MyApplication.alarmIconFontSize,
                      ),
                    ),
                  ),
                ],
              ), 
            Padding(
              padding: EdgeInsets.only(bottom:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 0),
                    // Top Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 1),
                    // Middle Top Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 2),
                  ],
                ),
            ),
            Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // Middle Right Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 3),
                  // Middle Left Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 4),
                  // Middle Grand Price.
                  CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 5),
                ],
              ),           
            Padding(
              padding: EdgeInsets.only(top:horizontalGrandPriceSpaceces, bottom:horizontalGrandPriceSpaceces),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Bottom Left Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 6),
                    // Middle Bottom Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 7),
                    // Bottom Right Grand Price.
                    CompetitionScreenHelper(isLive:false, sampleForTesting: widget.sampleForTesting, competition: widget.competition, grandPriceIndex: 8),
                  ],
                ),
            ),
            
          ],
        );
    
    }
      
    return grid;
  
  }

}