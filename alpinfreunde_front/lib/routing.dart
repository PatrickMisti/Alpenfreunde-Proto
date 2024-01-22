import 'package:alpinfreunde_front/appointment_list_component/appointment_list_view.dart';
import 'package:alpinfreunde_front/creation_component/creation_view.dart';
import 'package:alpinfreunde_front/dashboard_component/dashboard_view.dart';
import 'package:alpinfreunde_front/settings_component/settings_view.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:stacked/stacked.dart';

enum RoutingEnum {
  dashboard,
  creation,
  appointment,
  settings,
  errorPage,
}

abstract class Routing {
  static final List<RoutingEnum> _mainRouting = [RoutingEnum.dashboard];

  static Widget _getRoutePage(RoutingEnum config) => switch (config) {
        RoutingEnum.dashboard => DashboardView(),
        RoutingEnum.creation => const CreationView(),
        RoutingEnum.appointment => const AppointmentListView(),
        RoutingEnum.settings => const SettingsView(),
        RoutingEnum.errorPage => _errorPage()
      };

  static Route<dynamic> onGenerateRoute(RouteSettings routerConfig) {
    RoutingEnum configRoute = RoutingEnum.values.firstWhere(
        (RoutingEnum element) => element.name == routerConfig.name,
        orElse: () => RoutingEnum.errorPage);

    var widget = _getRoutePage(configRoute);

    if (_mainRouting.any((element) => element == configRoute))
      return MaterialPageRoute(builder: (context) => widget);
    return MaterialPageRoute(builder: (context) => _errorPage());
  }

  static Widget nestedRouting(RoutingEnum route) {
    var widget = _getRoutePage(route);

    if (_mainRouting.any((element) => element == route)) return _errorPage();

    return widget;
  }

  static RouterConfig<Object> get routerOutlet => GoRouter(
        routes: [
          GoRoute(
            path: RoutingEnum.dashboard.name,
            builder: (context, state) => DashboardView(),
            routes: [
              GoRoute(
                path: RoutingEnum.creation.name,
                builder: (context, state) => CreationView(),
              ),
              GoRoute(
                path: RoutingEnum.appointment.name,
                builder: (context, state) => AppointmentListView(),
              ),
              GoRoute(
                path: RoutingEnum.settings.name,
                builder: (context, state) => SettingsView(),
              ),
            ],
          ),
        ],
      );

  static Scaffold _errorPage() {
    return const Scaffold(
      body: Center(
        child: Text("404 not found!!!"),
      ),
    );
  }
}
