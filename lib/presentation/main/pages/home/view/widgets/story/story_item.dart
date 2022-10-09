import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';

class StoryItem extends StatelessWidget {
  final String image;
  final Color color;

  const StoryItem({Key? key, required this.image, required this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          width: 72.w,
          height: 72.h,
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            color: color,
            border: Border.all(color: color, width: 1),
          ),
          child: Center(
            child: Container(
              width: 70.w,
              height: 70.h,
              alignment: Alignment.center, // where to position the child
              decoration: BoxDecoration(
                  shape: BoxShape.circle,

                  color: Colors.red,
                  border: Border.all(color: ColorManager.white, width: 2),
                  image: DecorationImage(image: AssetImage(image))),
            ),
          ),
        ),
      ],
    );
  }
}
