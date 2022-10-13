import 'package:flutter/material.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

class CustomChip extends StatelessWidget {
  final String text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(AppPadding.p6),
      decoration: BoxDecoration(
        color: ColorManager.chipColor,
        border: Border.all(
          width: 1,
          color: ColorManager.primary
        ),
        borderRadius: BorderRadius.circular(AppRadius.r30)
      ),
      child: Text(text),
    );
  }

  const CustomChip({
    required this.text,
  });
}
