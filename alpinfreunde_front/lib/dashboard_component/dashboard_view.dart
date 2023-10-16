import 'package:alpinfreunde_front/dashboard_component/dashboard_model.dart';
import 'package:flutter/material.dart';
import 'package:responsive_framework/responsive_breakpoints.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StackedView<DashboardModel> {
  const DashboardView({super.key});

  @override
  Widget builder(
      BuildContext context, DashboardModel viewModel, Widget? child) {
    return Scaffold(
      body: Center(
          child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.COLUMN,
        children: [
          
        ],
      ),),
      bottomNavigationBar: ResponsiveBreakpoints.of(context).isMobile
          ? BottomNavigationBar(items: const [
              BottomNavigationBarItem(
                  icon: Icon(Icons.add_box_rounded), label: "Add"),
              BottomNavigationBarItem(icon: Icon(Icons.create), label: "Edit")
            ])
          : null,
    );
  }

  @override
  DashboardModel viewModelBuilder(BuildContext context) {
    return DashboardModel();
  }
}
