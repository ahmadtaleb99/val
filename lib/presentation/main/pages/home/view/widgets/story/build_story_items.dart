import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';

import 'story_item.dart';


class BuildStoryItems extends StatelessWidget {
  const BuildStoryItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: ListView.builder(

          itemCount: 7,
          scrollDirection: Axis.horizontal,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return StoryItem(
                image: ImageAssets.logo, color: ColorManager.secondary);
          }),
    );
  }
}
