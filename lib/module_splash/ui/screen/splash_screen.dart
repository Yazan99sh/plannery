import 'package:plannery/module_home/home_routes.dart';
import 'package:plannery/module_init/init_routes.dart';
import 'package:plannery/module_init/presistance/init_prefs_helper.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

@provide
class SplashScreen extends StatefulWidget {
  final InitPrefsHelper _initPrefsHelper;

  SplashScreen(this._initPrefsHelper);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp)  {
       Future.delayed(Duration(milliseconds: 500)).whenComplete((){
         _getNextRoute().then((route) {
          Navigator.of(context).pushNamedAndRemoveUntil(route, (route) => false);
        });
      });
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(
            'assets/images/logo.png',
            width: 175,
            height: 175,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ),
    );
  }

  Future<String> _getNextRoute() async {
    try {
      var cached = await widget._initPrefsHelper.getUsername();
      if (cached != null) {
        return await HomeRoutes.HOME_SCREEN;
      } else {
        return await InitRoutes.Init_Screen;
      }
    } catch (e) {
      return await InitRoutes.Init_Screen;
    }
  }
}

