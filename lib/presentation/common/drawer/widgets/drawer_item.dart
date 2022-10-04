import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DrawerItem extends StatelessWidget {
  const DrawerItem({Key? key, required this.icon, required this.title, this.onTap}) : super(key: key);
  final Widget icon;
  final String title;
  final void Function()? onTap;

  @override
  Widget build(BuildContext context) {
    return Material(

      color: Colors.transparent,
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding:  EdgeInsets.symmetric(vertical: 12.5.h,horizontal: 56.w),
          child: Row(
     children: [
           icon,
           SizedBox(width: 19.5.w,),
           Text(title),
     ],
          ),
        ),
      ),
    );
  }
}
