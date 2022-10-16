import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/common/circular_container.dart';
import 'package:val/presentation/main/pages/home/view/widgets/story/story_item.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';
import 'dart:ui';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart' as inset;

class ChatBottomSheet {
  void show(BuildContext context) {
    showModalBottomSheet(
        elevation: 10,
        isScrollControlled: true,
        shape: const RoundedRectangleBorder(
            borderRadius:
                BorderRadius.vertical(top: Radius.circular(AppRadius.r40))),
        builder: (context) {
          return ChatBottomSheetBody();
        },
        context: context);
  }
}

class ChatBottomSheetBody extends StatelessWidget {
  const ChatBottomSheetBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
      height: 718.h,
      child: Column(
        children: [
          SizedBox(
            height: 15.h,
          ),
          const BottomSheetNotch(),
          SizedBox(
            height: 35.h,
          ),
          const OfferDetails(),
          SizedBox(
            height: 30.h,
          ),
          Expanded( child: BuildChatList()),
          MessageTypingFieldWidget()
        ],
      ),
    );
  }
}

class BottomSheetNotch extends StatelessWidget {
  const BottomSheetNotch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 4.h,
      width: 72.w,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: ColorManager.primary,
      ),
    );
  }
}

class OfferDetails extends StatelessWidget {
  const OfferDetails({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CircularContainer(
            image: 'assets/images/img.png', color: ColorManager.lightSecondary),
        SizedBox(
          width: 15.w,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Perfume',
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontSize: 20.sp)),
            Text('Beuaty And Skin Care'),
          ],
        )
      ],
    );
  }
}

class BuildChatList extends StatelessWidget {
  const BuildChatList({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Padding(
            padding:  EdgeInsets.symmetric(vertical: 6.0.h),
            child: ChatBubble(
                message: 'is the offer still on?',
                isMe: ( index % 2 == 0 || index ==5) ?true : false ,
                date: '2:15 Pm',
                profilePicture: 'assets/images/img.png'),
          );
        });
  }
}

class ChatBubble extends StatelessWidget {
  final bool isMe;
  final String date;
  final String profilePicture;
  final String message;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (!isMe)
              Expanded(
                flex: 2,
                child: CircleAvatar(

                  backgroundImage: const AssetImage(ImageAssets.profile),

                  radius: 30.h  ,
                ),
              ),
            Expanded(
              flex: 9,
              child: Container(
                padding: EdgeInsets.all(AppPadding.p12),
                width: double.infinity,
                height: 47.h,
                decoration: inset.BoxDecoration(
                  color: ColorManager.chatBubbleColor,
                    boxShadow: [

                      inset.BoxShadow(
                        color: Colors.black,
                           spreadRadius: -4.5,
                           blurRadius: 4,
                           offset: const Offset(0  , 2),
                        inset: true


                      ),
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
                child: Text(message,textDirection: isMe?  TextDirection.rtl : TextDirection.ltr,),
              ),

            )
          ],
        ),
        Align(
          alignment: isMe ? Alignment.topLeft : Alignment.topRight,

          child: Padding(
            padding:  EdgeInsets.only(right: AppPadding.p12,left:AppPadding.p12,top: isMe ? 3: 4),
            child: Text(date,style: Theme.of(context).textTheme.titleSmall?.copyWith(fontSize: 13.sp),),
          ),
        )

      ],
    );
  }

  const ChatBubble({
    required this.message,
    required this.isMe,
    required this.date,
    required this.profilePicture,
  });
}

class MessageTypingFieldWidget extends StatelessWidget {
  const MessageTypingFieldWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return   Container(
      margin: EdgeInsets.only(bottom: 10.h),
      color: ColorManager.white,
      child: Container(
      decoration: inset.BoxDecoration(
      color: ColorManager.chatBubbleColor,
      borderRadius: BorderRadius.circular(20.r),
      boxShadow: const [
       inset.BoxShadow(
      color: Colors.black,
      spreadRadius: -3 ,
      blurRadius: 4,
      offset:  Offset(0  , 2),
      inset: true
      ),
      ],),
      child: TextField(
        decoration: InputDecoration(
          fillColor: Colors.transparent,
          hintText: AppStrings.typeAMessage,
          suffixIcon: Row(
            children: [

            ],
          )
        ),
      ),
      ),
    );

  }
}


