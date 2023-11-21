import 'package:alpinfreunde_front/base/parent_component.dart';
import 'package:alpinfreunde_front/routing.dart';
import 'package:alpinfreunde_front/shell_component/shell_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/breakpoint.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:stacked/stacked.dart';

class ShellView extends StackedView<ShellModel> implements IParentComponent {
  const ShellView({super.key});

  @override
  Widget builder(BuildContext context, ShellModel viewModel, Widget? child) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'AlpinFreunde',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: Routing.onGenerateRoute,
      initialRoute: RoutingEnum.dashboard.name,
      builder: (context, child) => ResponsiveBreakpoints(
        breakpoints: const [
          Breakpoint(start: 0, end: 800, name: MOBILE),
          Breakpoint(start: 800, end: double.infinity, name: DESKTOP)
        ],
        child: child!,
      ),
    );
  }

  @override
  ShellModel viewModelBuilder(BuildContext context) {
    return ShellModel();
  }
}
