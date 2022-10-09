import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/presentation/common/custom_shadow_box.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

import '../resources/strings_manager.dart';

class SearchTextField extends StatelessWidget {
  const SearchTextField({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomShadowBox(
      child: SizedBox(
        height: 40.h,
        child: TextField(
          decoration: InputDecoration(

              suffixIcon: Padding(

              padding:  EdgeInsets.only(right: 8.0.w,top: 10.0.h,bottom: 12.h),
              child: SvgPicture.asset(ImageAssets.searchIcon,clipBehavior: Clip.antiAlias,height: 30.h,width: 20,),
            ),

              isDense: true,                      // Added this
              contentPadding: const  EdgeInsets.all(AppPadding.p8),  // Added this

            hintText: AppStrings.search
          ),
        ),
      ),
    );
  }
}
