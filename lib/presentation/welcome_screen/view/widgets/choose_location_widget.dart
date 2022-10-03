import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/presentation/common/custom_shadow_box.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

class ChooseLocationWidget extends StatelessWidget {
  const ChooseLocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(children: [
              Text(AppStrings.chooseLocation,style: Theme.of(context).textTheme.bodyLarge,),
          SizedBox(width: 10.w,),
          SvgPicture.asset(ImageAssets.closedArrow)
        ],),
        SizedBox(height: 10.h,),
       CustomShadowBox(child: TextFormField(
         decoration: InputDecoration(

             hintText: AppStrings.chooseLocation
         ),

       )),

      ],
    );
  }
}
