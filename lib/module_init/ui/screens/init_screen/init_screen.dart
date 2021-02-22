import 'dart:async';
import 'package:plannery/module_home/home_routes.dart';
import 'package:plannery/module_init/stat_manager/init/init_state_manager.dart';
import 'package:plannery/module_init/ui/state/init_state/init_state.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';
@provide
class InitScreen extends StatefulWidget {
  final InitStateManager _initStateManager;
  @override
  InitScreenState createState() => InitScreenState();

  InitScreen(this._initStateManager);
}

class InitScreenState extends State<InitScreen> {
  StreamSubscription _streamSubscription;
  InitState currentState;
  void refresh() {
    if (mounted) {
      setState(() {});
    }
  }
  void setUsername(String name) {
    widget._initStateManager.setUsername(name, this);
  }
  void moveToHome() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      Navigator.of(context).pushNamedAndRemoveUntil(
           HomeRoutes.HOME_SCREEN, (r) => false);
    });
  }
  @override
  void initState() {
    widget._initStateManager.stateStream.listen((event) {
      currentState = event;
      if (mounted) {
        setState(() {});
      }
    });
    getInitState();
    super.initState();
  }
  void getInitState() {
    widget._initStateManager.getInitState(this);
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
