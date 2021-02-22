import 'package:flutter/material.dart';

PreferredSizeWidget appbar(BuildContext context){

  return AppBar(
    backgroundColor: Colors.grey[50],
    elevation: 0,
    leading: IconButton(
      icon: Icon(Icons.menu,color:Theme.of(context).primaryColor,),
      onPressed: null,
    ),
    centerTitle: true,
    title: Text('PLANNERY',style: TextStyle(
        color: Theme.of(context).primaryColor
    ),),
    actions: [
      IconButton(
        icon: Icon(Icons.more_vert,color:Theme.of(context).primaryColor,),
        onPressed: null,
      ),
    ],
  );
}