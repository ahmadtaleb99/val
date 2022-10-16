import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/common/circular_container.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';

class StoryItem extends StatelessWidget {
  final String image;
  final Color color;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: CircularContainer(
        image: image,
        color: color,
      ),
    );
  }

  const StoryItem({
    required this.image,
    required this.color,
    this.onTap,
  });
}
