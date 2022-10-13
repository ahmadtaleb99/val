import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

class CustomShadowBox extends StatelessWidget {
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ColorManager.white,
        borderRadius: const BorderRadius.all(
          Radius.circular(AppRadius.r6),
        ),
        boxShadow: [
          BoxShadow(
              color: ColorManager.hintColor,
              blurRadius: AppRadius.r6,
              offset: Offset(0, 1),
              spreadRadius: -3),
        ],
      ),
      child: child,
    );
  }

  const CustomShadowBox({
    required this.child,
  });
}
