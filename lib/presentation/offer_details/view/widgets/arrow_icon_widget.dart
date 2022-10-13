import 'package:flutter/material.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

class ArrowIconWidget extends StatelessWidget {

  final Widget icon;
  @override
  Widget build(BuildContext context) {
    return  Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(

              color: ColorManager.black,
              blurRadius: 5,
              spreadRadius: -3,)
          ],
        ),
        child: icon);
  }

  const ArrowIconWidget({
    required this.icon,
  });
}
