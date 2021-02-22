import 'package:plannery/abstracts/module/yes_module.dart';
import 'package:plannery/module_init/ui/screens/init_screen/init_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:inject/inject.dart';
import 'init_routes.dart';
import 'stat_manager/init/init_state_manager.dart';

@provide
class InitModule extends YesModule {
   final InitStateManager _initStateManager;

   InitModule(this._initStateManager);

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      InitRoutes.Init_Screen : (context) => InitScreen(_initStateManager)
    };
  }
}
