import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/assets_manager.dart';

class DrawerProfileWidget extends StatelessWidget {
  const DrawerProfileWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:  EdgeInsets.only(left: 35.0.w,top: 39.h),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(

            backgroundImage: const AssetImage(ImageAssets.profile),

            radius: 30.h  ,
          ),
          SizedBox(width: 10.w,),
          Text('Yara Alnor',
          )
        ],
      ),
    );
  }
}
