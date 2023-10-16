import 'package:alpinfreunde_front/dashboard_component/dashboard_view.dart';
import 'package:flutter/material.dart';

enum RoutingEnum {
  dashboard,
  errorPage,
}

abstract class Routing {

  static Widget getRoutePage(RoutingEnum config) => switch (config) {
    RoutingEnum.dashboard => const DashboardView(),
    RoutingEnum.errorPage => errorPage()
  };

  static Route<dynamic> onGenerateRoute(RouteSettings routerConfig) {
    RoutingEnum configRoute = RoutingEnum.values.firstWhere(
            (RoutingEnum element) => element.name == routerConfig.name,
        orElse: () => RoutingEnum.errorPage);
    return MaterialPageRoute(builder: (context) => getRoutePage(configRoute));
  }

  static Scaffold errorPage() {
    return const Scaffold(
      body: Center(child: Text("404 not found!!!"),),
    );
  }
}