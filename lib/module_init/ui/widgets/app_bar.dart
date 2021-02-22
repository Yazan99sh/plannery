import 'package:plannery/module_init/presistance/init_prefs_helper.dart';
import 'package:plannery/module_splash/splash_routes.dart';
import 'package:flutter/material.dart';

PreferredSizeWidget appbar(BuildContext context,[bool home=true]) {
  InitPrefsHelper _init = InitPrefsHelper();
  return AppBar(
    backgroundColor: Colors.grey[50],
    elevation: 0,
    leading:home?IconButton(
      icon: Icon(
        Icons.menu,
        color: Theme.of(context).primaryColor,
      ),
      onPressed: null,
    ):Container(),
    centerTitle: true,
    title: Text(
      'PLANNERY',
      style: TextStyle(color: Theme.of(context).primaryColor),
    ),
    actions: [
      home?PopupMenuButton(
        icon: Icon(
          Icons.more_vert,
          color: Theme.of(context).primaryColor,
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
                  color: Colors.blue
                ),
              ),
            ),
          ),
        ],
      ):Container(),
    ],
  );
}
