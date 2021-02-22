import 'package:plannery/abstracts/module/yes_module.dart';
import 'package:plannery/module_settings/setting_routes.dart';
import 'package:plannery/module_settings/ui/settings_page/settings_page.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

@provide
class SettingsModule extends YesModule {
  final SettingsScreen _settingsScreen;

  SettingsModule(this._settingsScreen);

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {SettingRoutes.ROUTE_SETTINGS: (context) => _settingsScreen};
  }
}
