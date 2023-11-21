
import 'package:alpinfreunde_front/base/child_component.dart';
import 'package:alpinfreunde_front/creation_component/creation_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:stacked/stacked.dart';

class CreationView extends StackedView<CreationModel> implements IChildComponent {
  const CreationView({super.key});

  @override
  Widget builder(BuildContext context, CreationModel viewModel, Widget? child) {
    return Center(
      child: Text("CreationView"),
    );
  }

  @override
  CreationModel viewModelBuilder(BuildContext context) {
    return CreationModel();
  }

}
