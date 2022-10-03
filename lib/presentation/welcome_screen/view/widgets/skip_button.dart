import 'package:flutter/material.dart';
import 'package:val/presentation/common/custom_shadow_box.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';

class SkipButton extends StatelessWidget {
  const SkipButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(style: ElevatedButton.styleFrom(
      primary: ColorManager.white
    ),onPressed: () {}, child:   Text(AppStrings.skip,style: Theme.of(context).textTheme.bodyLarge,));
  }
}
