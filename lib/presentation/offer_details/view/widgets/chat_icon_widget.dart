import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/presentation/common/chat/view/chat_bottom_sheet.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

class ChatIconWidget extends StatelessWidget {
  const ChatIconWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        onTap: () => ChatBottomSheet().show(context),
        child: Container(

          decoration: BoxDecoration(
            color: Colors.transparent,
            boxShadow: [
              BoxShadow(

                color: ColorManager.grey,
                blurRadius: 12 ,
                spreadRadius: -5,)
            ],
          ),
          child: CircleAvatar(
            radius: 30.h,
            backgroundColor: ColorManager.white,
            child: SvgPicture.asset(ImageAssets.chatIcon),
          ),
        ),
      ),
    );
  }
}
