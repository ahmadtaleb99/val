import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/chat/bloc/chat_bloc.dart';
import 'package:val/presentation/common/circular_container.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
as inset;
import '../../../resources/color_manager.dart';


class ChatBubble extends StatelessWidget {

 final Message message;
 final bool isMe;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            if (!isMe)
              Expanded(
                flex: 3,
                child: CircleAvatar(
                  backgroundImage: const AssetImage(ImageAssets.profile),
                  radius: 30.h,
                ),
              ),
            Expanded(
              flex: 11,
              child: Container(
                padding: EdgeInsets.all(AppPadding.p12),

                decoration: inset.BoxDecoration(
                    color: ColorManager.chatBubbleColor,
                    boxShadow: [
                      inset.BoxShadow(
                          color: Colors.black,
                          spreadRadius: -4.5,
                          blurRadius: 4,
                          offset: const Offset(0, 2),
                          inset: true),
                    ],
                    borderRadius: isMe
                        ? const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.r20),
                      topRight: Radius.circular(AppRadius.r20),
                      bottomLeft: Radius.circular(AppRadius.r20),
                    )
                        : const BorderRadius.only(
                      topLeft: Radius.circular(AppRadius.r20),
                      topRight: Radius.circular(AppRadius.r20),
                      bottomRight: Radius.circular(AppRadius.r20),
                    )),
                child: message.media != null  ? Image.file(File(message.media!)) : Text(

                  message.text,
                  textAlign: isMe ? TextAlign.end : TextAlign.start,
                  overflow: TextOverflow.visible,
                ),
              ),
            )
          ],
        ),
        Align(
          alignment: isMe ? Alignment.topLeft : Alignment.topRight,
          child: Padding(
            padding: EdgeInsets.only(
                right: AppPadding.p12, left: AppPadding.p12, top: isMe ? 3 : 4),
            child: Text(
              message.date,
              style: Theme.of(context)
                  .textTheme
                  .titleSmall
                  ?.copyWith(fontSize: 13.sp),
            ),
          ),
        )
      ],
    );
  }

  const ChatBubble({
    required this.message,
    required this.isMe,

  });
}
