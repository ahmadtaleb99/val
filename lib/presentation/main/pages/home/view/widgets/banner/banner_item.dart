import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/values_manager.dart';

class BannerItem extends StatelessWidget {
  final String image;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 310.h,

      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(AppRadius.r4),
        image: DecorationImage(

          image: AssetImage(image),
          fit: BoxFit.cover,
        )
      ),
    );
  }

  const BannerItem({
    required this.image,
  });
}
