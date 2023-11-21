import 'package:alpinfreunde_front/appointment_list_component/appointment_list_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:stacked/stacked.dart';

class AppointmentListView extends StackedView<AppointmentListModel> {
  const AppointmentListView({super.key});

  @override
  Widget builder(BuildContext context, AppointmentListModel viewModel, Widget? child) {
    return Center(
      child: Text("AppointmentList"),
    );
  }

  @override
  AppointmentListModel viewModelBuilder(BuildContext context) {
    return AppointmentListModel();
  }

}
