library app.core;

import 'package:flutter/material.dart';
import 'package:fluttergram/helpers/navigator.dart';
import 'package:fluttergram/locator.dart';
import 'package:fluttergram/ui_shared/constanst.dart';
import 'package:fluttergram/ui_shared/size_config.dart';


part 'validate_otp.dart';

class CoreView extends StatelessWidget {
   static String route = '/core';
  final NavigatorService navigator = locator<NavigatorService>();

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: ValidateOtpView.route,
      key: navigator.coreNavigatorKey,
      onGenerateRoute: coreRouteStack,
    );
  }
}

Route<dynamic>? coreRouteStack(RouteSettings settings) {
  Map<String, Route<dynamic>> appRouting = <String, Route<dynamic>>{
    ValidateOtpView.route: MaterialPageRoute<dynamic>(
      settings: RouteSettings(name: settings.name),
      builder: (_) => ValidateOtpView(),
    )   
    
  };
  return appRouting[settings.name];
}
