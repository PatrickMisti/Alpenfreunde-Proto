
import 'package:alpinfreunde_front/settings_component/settings_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class SettingsView extends StackedView<SettingsModel> {
  const SettingsView({super.key});

  @override
  Widget builder(BuildContext context, SettingsModel viewModel, Widget? child) {
    return Center(
      child: Text("SettingsView"),
    );
  }

  @override
  SettingsModel viewModelBuilder(BuildContext context) {
    return SettingsModel();
  }


}
