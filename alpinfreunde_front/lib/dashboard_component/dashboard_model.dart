import 'dart:async';

import 'package:get_it/get_it.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:rxdart/rxdart.dart';
import 'package:stacked/stacked.dart';

class DashboardModel extends BaseViewModel with Disposable {
  late BehaviorSubject<ResponsiveRowColumnType> test;

  DashboardModel();

  init() {
    test = BehaviorSubject<ResponsiveRowColumnType>.seeded(ResponsiveRowColumnType.COLUMN);
  }

  click() {
    var item = test.value == ResponsiveRowColumnType.COLUMN
        ? ResponsiveRowColumnType.ROW
        : ResponsiveRowColumnType.COLUMN;

    test.add(item);
    notifyListeners();
  }

  @override
  FutureOr onDispose() {

  }
}