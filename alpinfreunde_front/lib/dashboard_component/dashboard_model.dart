import 'dart:async';
import 'package:alpinfreunde_front/models/sidebarItem.dart';
import 'package:alpinfreunde_front/routing.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:stacked/stacked.dart';

class DashboardModel extends BaseViewModel with Disposable {

  final List<SidebarItem> sidebar = [
    SidebarItem(title: "Termin erstellen", icons: const Icon(Icons.add), routing: RoutingEnum.creation),
    SidebarItem(title: "Terminübersicht", icons: const Icon(Icons.list), routing: RoutingEnum.appointment),
    SidebarItem(title: "Einstellungen", icons: const Icon(Icons.settings), routing: RoutingEnum.settings),
  ];

  RoutingEnum _currentView = RoutingEnum.creation;

  RoutingEnum get currentRoute => _currentView;

  DashboardModel();

  changeView(RoutingEnum newView) {
    _currentView = newView;
    notifyListeners();
  }

  @override
  FutureOr onDispose() {

  }
}