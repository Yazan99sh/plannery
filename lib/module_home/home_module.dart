import 'package:plannery/abstracts/module/yes_module.dart';
import 'package:plannery/module_home/home_routes.dart';
import 'package:plannery/module_home/state_manager/home/home_state_manager.dart';
import 'package:plannery/module_home/ui/screens/home_screen/home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';


@provide
class HomeModule extends YesModule {
final HomeStateManager _homeStateManager;

HomeModule(this._homeStateManager);

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      HomeRoutes.HOME_SCREEN : (context) => HomeScreen(_homeStateManager)
    };
  }
}
