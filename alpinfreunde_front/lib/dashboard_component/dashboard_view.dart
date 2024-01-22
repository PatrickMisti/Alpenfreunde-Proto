import 'package:alpinfreunde_front/base/parent_component.dart';
import 'package:alpinfreunde_front/dashboard_component/dashboard_model.dart';
import 'package:alpinfreunde_front/routing.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:stacked/stacked.dart';

class DashboardView extends StackedView<DashboardModel>
    implements IParentComponent {
  DashboardView({super.key});

  final Duration _animationDuration = const Duration(milliseconds: 200);
  Color dividerColor = Colors.black;

  getDrawer(BuildContext context, DashboardModel vm) {
    return ResponsiveRowColumnItem(
      child: ResponsiveVisibility(
        visible: ResponsiveBreakpoints.of(context).isDesktop,
        child: Expanded(
          flex: 2,
          child: Container(
            decoration: BoxDecoration(
              border: Border(
                right: BorderSide(color: dividerColor, width: 1),
              ),
            ),
            child: Column(
              children: (vm.sidebar
                  .map((e) => ListTile(
                        onTap: () {
                          vm.changeView(e.routing);
                        },
                        title: Row(
                          children: [
                            e.icons,
                            Container(
                              padding: const EdgeInsets.only(left: 5),
                              child: Text(
                                e.title,
                              ),
                            )
                          ],
                        ),
                      ))
                  .toList()),
            ),
          ),
        ),
      ),
    );
  }

  getBottomNav(BuildContext context, DashboardModel vm) {
    if (!ResponsiveBreakpoints.of(context).isMobile) return null;

    return BottomNavigationBar(//todo change view not work correctly
        onTap: (value) {
          var index = vm.sidebar[value - 1];
          debugPrint(value.toString());
          vm.changeView(index.routing);
        },
        items: (vm.sidebar.map(
          (e) => BottomNavigationBarItem(
            icon: e.icons,
            label: e.title,
          ),
        )).toList());
  }

  @override
  Widget builder(
      BuildContext context, DashboardModel viewModel, Widget? child) {
    return Scaffold(
      appBar: AppBar(title: const Text("data")),
      body: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.ROW,
        children: [
          getDrawer(context, viewModel),
          ResponsiveRowColumnItem(
            rowFlex: 6,
            child: AnimatedSwitcher(
              duration: _animationDuration,
              transitionBuilder: (child, animation) => ScaleTransition(
                scale: animation,
                child: child,
              ),
              child: Go,
            ),
          )
        ],
      ),
      bottomNavigationBar: getBottomNav(context, viewModel),
    );
  }

  @override
  DashboardModel viewModelBuilder(BuildContext context) {
    return DashboardModel();
  }
}
