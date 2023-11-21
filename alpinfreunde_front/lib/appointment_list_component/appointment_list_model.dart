import 'dart:async';
import 'package:alpinfreunde_front/base/child_component.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

class AppointmentListModel extends BaseViewModel with Disposable implements IChildComponent {

  AppointmentListModel();


  @override
  FutureOr onDispose() {
  }
}