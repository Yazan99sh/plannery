import 'package:plannery/module_init/presistance/init_prefs_helper.dart';
import 'package:plannery/module_splash/splash_routes.dart';
import 'package:flutter/material.dart';
import 'package:plannery/module_theme/pressistance/theme_preferences_helper.dart';
import 'package:plannery/module_theme/service/theme_service/theme_service.dart';

PreferredSizeWidget appbar(BuildContext context,[bool home=true]) {
  bool darkMode = false;
  if (AppBarTheme.of(context).color == Colors.black){
darkMode = true ;
  }
  InitPrefsHelper _init = InitPrefsHelper();
  AppThemeDataService _theme = AppThemeDataService(ThemePreferencesHelper());
  return AppBar(
    backgroundColor: AppBarTheme.of(context).color,
    elevation: 0,
    leading:home?IconButton(
      icon: Icon(
        Icons.menu,
        color: Theme.of(context).primaryColorDark,
      ),
      onPressed: null,
    ):Container(),
    centerTitle: true,
    title: Text(
      'PLANNERY',
      style: TextStyle(color: Theme.of(context).primaryColorDark),
    ),
    actions: [
      IconButton(
        onPressed: (){
          _theme.switchDarkMode(!darkMode);
        },
        icon: Icon(darkMode?Icons.nights_stay:Icons.wb_sunny,color:Theme.of(context).primaryColorDark,),
      ),
      home?PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: Theme.of(context).primaryColorDark,
        ),
        onSelected: (result) {
          _init.clearPrefs();
          Navigator.of(context).pushNamedAndRemoveUntil(
              SplashRoutes.SPLASH_SCREEN, (route) => false);
        },
        itemBuilder: (_) => <PopupMenuEntry>[
          const PopupMenuItem(
            value: 'Exit',
            child: ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.blue),
              title: Text(
                'Exit',
                style: TextStyle(
                  color: Colors.blue,
                ),
              ),
            ),
          ),
        ],
      ):Container(),
    ],
  );
}
