import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButtonWidget extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ElevatedButton(

          style:  Theme.of(context).elevatedButtonTheme.style?.copyWith(

            backgroundColor: MaterialStateProperty.all(color)
          ),
          onPressed: onPressed, child: Text(text)),
    );
  }

  const CustomButtonWidget({
    required this.text,
    this.onPressed,
    this.color,
  });
}
