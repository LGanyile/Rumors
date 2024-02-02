import 'package:flutter/material.dart';
import 'package:rumors/main.dart';

import 'competition_widget.dart';
import 'page_navigation.dart';
import 'store_info_widget.dart';
import '../main.dart';

class OnPlayWidget extends StoreInfoWidget{

  OnPlayWidget({super.key, 
    required store
  }):super(store:store);
  
  @override 
  State createState() =>OnPlayWidgetState();

}

class OnPlayWidgetState extends State<OnPlayWidget>{

  @override
  Widget build(BuildContext context) {
    
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.only(bottom: 10),
          child: widget.retrieveStoreImage(context),
        ),
        Column(
          children: [
            widget.retrieveStoreDetails(context),
            IconButton(
              onPressed: (() => Navigator.of(context).push(
              CustomPageRoute( child: CompetitionWidget(store: widget.store,)),)),
              icon: Icon(
                color: Colors.green,
                Icons.play_circle,
                size: MyApplication.playCompetitionIconFontSize,
              ),
            ),
          ],
        ),
      ],
    );
  }
}