import 'dart:async';
import 'package:plannery/module_home/state_manager/home/home_state_manager.dart';
import 'package:plannery/module_home/ui/state/home_state/home_state.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
@provide
class HomeScreen extends StatefulWidget {
  final HomeStateManager _homeStateManager;
  @override
  HomeScreenState createState() => HomeScreenState();

  HomeScreen(this._homeStateManager);
}

class HomeScreenState extends State<HomeScreen> {
  StreamSubscription _streamSubscription;
  HomeState currentState;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  void createAppointments(String date) {
    widget._homeStateManager.createAppointments(date, this);
  }
  void selectedAppointment(int index,var data,List users) {
    widget._homeStateManager.selectedAppointment(index,data,users,this);
  }
  void unselectedAppointment(data){
    widget._homeStateManager.unselectedAppointment(data, this);
  }
  @override
  void initState() {
    widget._homeStateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
    getAppointments();
    super.initState();
  }
  void getAppointments() {
    widget._homeStateManager.getAppointments(this);
  }
  @override
  void dispose() {
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
   return GestureDetector(
     onTap: (){
       var node = FocusScope.of(context);
       if (node.hasFocus){
         node.unfocus();
       }
     },
     child: Scaffold(
        body:currentState == null ? Container() : currentState.getUI(context),
      ),
   );
  }
}
