import 'package:plannery/abstracts/module/yes_module.dart';
import 'package:plannery/module_auth/ui/widget/email_password_login/email_password_login.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:inject/inject.dart';

import 'authorization_routes.dart';

@provide
class AuthorizationModule extends YesModule {
  AuthorizationModule() {}

  @override
  Map<String, WidgetBuilder> getRoutes() {
    return {
      AuthorizationRoutes.LOGIN_SCREEN: (context) => Scaffold(body:EmailPasswordForm(),),
      AuthorizationRoutes.REGISTER_SCREEN: (context) => Scaffold(),
    };
  }
}
