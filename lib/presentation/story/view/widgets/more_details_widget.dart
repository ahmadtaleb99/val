import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/presentation/resources/assets_manager.dart';

import '../../../resources/strings_manager.dart';

class MoreDetailsWidget extends StatelessWidget {
  const MoreDetailsWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Transform.rotate(
            angle: -90 * pi / 180,
            child: SvgPicture.asset(ImageAssets.detailsArrow)),
        SizedBox(height: 6.5.h,),
        Text(AppStrings.moreDetails,style: Theme.of(context).textTheme.bodyLarge,)
      ],
    );
  }
}
