import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/values_manager.dart';

import '../../../resources/color_manager.dart';

class BottomSheetNotch extends StatelessWidget {
  const BottomSheetNotch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: 72.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r10),
        color: ColorManager.primary,
      ),
    );
  }
}
