import 'package:plannery/abstracts/module/yes_module.dart';
import 'package:plannery/module_splash/splash_routes.dart';
import 'package:plannery/module_splash/ui/screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

@provide
class SplashModule extends YesModule {
  final SplashScreen _splashScreen;

  SplashModule(this._splashScreen);

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      SplashRoutes.SPLASH_SCREEN : (context) => _splashScreen
    };
  }
}