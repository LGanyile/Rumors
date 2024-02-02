
import 'package:flutter/material.dart';
import '../models/old_won_price.dart';
import '../main.dart';
import 'store_info_widget.dart';
import '../models/utilities.dart';
import 'dart:developer' as debug;

class WinnerWidget extends StatefulWidget{

  final WonPrice wonPrice;
  final bool showStoreInfoFirst;

  const WinnerWidget({super.key, 
    required this.wonPrice,
    this.showStoreInfoFirst = false,
  });

  @override 
  WinnerWidgetState createState()=>WinnerWidgetState();
}




class WinnerWidgetState extends State<WinnerWidget>{

  bool isKnown = false;
  String groupValue = '1';

  void onKnownChanged(value){
    setState(() {
      if(value=='Yes'){
        isKnown = true;
      }
      else{
        isKnown = false;
      }
    });
  }

  // Ask If The Current User Knows The Winner.
  Widget ask()=>Padding(
    padding: const EdgeInsets.only(bottom:20),
    child: Row(
      children: [
        Text('Do You Know ${widget.wonPrice.competition.winner!.isMale?'Him?':'Her?'}',
          style: TextStyle(
            fontSize: MyApplication.infoTextFontSize, 
            color: MyApplication.storeInfoTextColor,
            fontWeight: FontWeight.bold,
            decoration: TextDecoration.none,
          ),
        ),
        Row(
          children: [
            Radio(
              value: '1', 
              groupValue: groupValue, 
              onChanged: (value){setState(() {
                groupValue = value!;
              });}
            ),
            Radio(
              value: '2', 
              groupValue: groupValue, 
              onChanged: (value){setState(() {
                groupValue = value!;
              });}
            ),
          ],
        ),
      ],
    ),
  );

  // The Image Of A Winner. 
  Center winnerImage()=>Center(
    child: CircleAvatar(
      radius: MediaQuery.of(context).size.width/4,
      backgroundColor: Colors.orange,
      backgroundImage: AssetImage(
        widget.wonPrice.competition.winner!.findImageLocation(),
      ),
      /*backgroundImage: NetworkImage(
        widget.wonPrice.competition.winner!.findImageLocation(),
      ),*/
    ),
  );

  // Information About The Price Won.
  Column priceInfo(BuildContext context){

    String wonPriceDescription = widget.wonPrice.grandPrice.description;
    Color wonPriceDescriptionColor = const Color.fromARGB(255, 244, 3, 184);

    double screenWidth = MediaQuery.of(context).size.width;
    int singleLineMaxNoOfCharacters = screenWidth~/9;
    
    double containerHeight;

    if(wonPriceDescription.length>singleLineMaxNoOfCharacters){
      containerHeight = 18 * (wonPriceDescription.length/singleLineMaxNoOfCharacters);
      
    }
    else{
      containerHeight = 18;
    }
    

    return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      // The Details Of What Is Won.
      Center(
        child: SizedBox(
          height: containerHeight,
          child: Text('Won Price [${widget.wonPrice.grandPrice.description}]',
            style: TextStyle(
              color: wonPriceDescriptionColor,
              fontSize: MyApplication.infoTextFontSize, 
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
              
              //overflow: TextOverflow.ellipsis,
            ),
          ),
        ),
      ),
      // Winner's Information
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Winner Username',
            style: TextStyle(
              fontSize: MyApplication.infoTextFontSize, 
              color: MyApplication.storeInfoTextColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          Text(widget.wonPrice.competition.winner!.username,
            style: TextStyle(
              fontSize: MyApplication.infoTextFontSize, 
              color: MyApplication.storeInfoTextColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
      
      // The Winning Date.
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text('Winning Date',
            style: TextStyle(
              fontSize: MyApplication.infoTextFontSize, 
              color: MyApplication.storeInfoTextColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
          Text(widget.wonPrice.competition.dateTime.toString().substring(0, 10),
            style: TextStyle(
              fontSize: MyApplication.infoTextFontSize, 
              color: MyApplication.storeInfoTextColor,
              fontWeight: FontWeight.bold,
              decoration: TextDecoration.none,
            ),
          ),
        ],
      ),
    ],
    );
  }
  
  @override 
  Widget build(BuildContext context)=>Column(
    children: [
      // Information About The Hosting Store.
        StoreInfoWidget(store: widget.wonPrice.store),
        ask(),
        winnerImage(),
        priceInfo(context),
    ],
  );
        
  onTap(BuildContext context){}

}
