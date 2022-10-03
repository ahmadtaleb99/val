import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/common/custom_shadow_box.dart';
import 'package:val/presentation/resources/strings_manager.dart';

class ChooseInterestWidget extends StatelessWidget {
  const ChooseInterestWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(AppStrings.chooseYourInterests,style: Theme.of(context).textTheme.bodyLarge,),
        SizedBox(height: 10.h,),
        CustomShadowBox(child: TextFormField(
          decoration: InputDecoration(

              hintText: AppStrings.chooseYourInterestsHint
          ),

        )),

      ],
    );
  }
}
