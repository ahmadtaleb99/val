import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/app/authtication_bloc/authentication_bloc.dart';
import 'package:image_picker/image_picker.dart';

import 'package:val/domain/model/models.dart';
import 'package:val/presentation/chat/view/picture_send_confirm_screen.dart';
import 'package:val/presentation/chat/view/widgets/bottom_sheet_notch.dart';
import 'package:val/presentation/chat/view/widgets/chat_bubble.dart';
import 'package:val/presentation/chat/view/widgets/chat_offer_details.dart';
import 'package:val/presentation/common/circular_container.dart';
import 'package:val/presentation/common/custom_chip/custom_chip.dart';
import 'package:val/presentation/main/pages/home/view/widgets/story/story_item.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';
import 'dart:ui';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/material.dart' hide BoxDecoration, BoxShadow;
import 'package:flutter_inset_box_shadow/flutter_inset_box_shadow.dart'
    as inset;

import '../bloc/chat_bloc.dart';

class ChatBottomSheet {
  void show(BuildContext context) {
    print(context.read<ChatBloc>().state.runtimeType);
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
    return Padding(
      padding:
          EdgeInsets.only(bottom: MediaQuery.of(context).viewInsets.bottom),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: AppPadding.p20),
        height: 718.h,
        child: BlocBuilder<ChatBloc, ChatState>(
  builder: (context, state) {
    return Column(
          children: [
            SizedBox(
              height: 15.h,
            ),
            const BottomSheetNotch(),
            SizedBox(
              height: 35.h,
            ),
            const ChatOfferDetails(),
            SizedBox(
              height: 30.h,
            ),
          Spacer(),
          BuildChatList(),

            SizedBox(
              height: 10.h,
            ),
            Align(
                alignment: Alignment.bottomCenter,
                child: MessageTypingFieldWidget())
          ],
        );
  },
),
      ),
    );
  }
}

class BuildPreDefinedMesseages extends StatelessWidget {
  const BuildPreDefinedMesseages({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ChatBloc,ChatState>(
  builder: (context, chatLoaded) {
    final state = chatLoaded as ChatLoaded;
    return SizedBox(
      height: 60.h,
      child: ListView.builder(
        itemCount: state.preDefinedMessages.length,
          scrollDirection: Axis.horizontal,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.all(AppPadding.p4),
              child: InkWell(onTap:(){
                context.read<ChatBloc>().add(MessageSent(
                  Message(
                      text: state.preDefinedMessages[index],
                      date: '2:51',
                      user: User(name: 'ahmad taleb', id: '1')),
                ));
              },child: CustomChip(text: state.preDefinedMessages[index])),
            );
          }),
    );
  },
);
  }
}

class BuildChatList extends StatelessWidget {
  void _scrollDown(int index) {
    _itemScrollController.scrollTo(
        index: index,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeIn);
  }

  BuildChatList({Key? key}) : super(key: key);

  final ItemScrollController _itemScrollController = ItemScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<ChatBloc, ChatState>(
      listener: (context, state) {
        if (state is ChatLoaded) {
          if (state.isMessageSent) {
            _scrollDown(state.messages.length - 1);
          }
        }
      },
      builder: (context, state) {
        if (state is ChatLoaded) {

          if(state.messages.isNotEmpty)
            {
              return Expanded(
                child: ScrollablePositionedList.builder(
                    itemCount: state.messages.length,
                    itemScrollController: _itemScrollController,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 6.0.h),
                        child: ChatBubble(
                          message: state.messages[index],
                          isMe: state.messages[index].user.id == '0' ? false : true,
                        ),
                      );
                    }),
              );


            }
          else return BuildPreDefinedMesseages();
        } else
          return const CircularProgressIndicator();
      },
    );
  }
}

class MessageTypingFieldWidget extends StatefulWidget {
  const MessageTypingFieldWidget({Key? key}) : super(key: key);

  @override
  State<MessageTypingFieldWidget> createState() =>
      _MessageTypingFieldWidgetState();
}

class _MessageTypingFieldWidgetState extends State<MessageTypingFieldWidget> {
  final _textController = TextEditingController();
  @override
  void dispose() {
    _textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 10.h),
      padding: EdgeInsets.only(bottom: 0),
      child: Container(
        decoration: inset.BoxDecoration(
          color: ColorManager.chatBubbleColor,
          borderRadius: BorderRadius.circular(25.r),
          boxShadow: const [
            inset.BoxShadow(
                color: Colors.black,
                spreadRadius: -3,
                blurRadius: 4,
                offset: Offset(0, 2),
                inset: true),
          ],
        ),
        child: BlocConsumer<ChatBloc, ChatState>(
          listener: (context, chatLoaded) {
            final state = (chatLoaded as ChatLoaded);
            _textController.text = state.currentMsg;
          },
          builder: (context, chatLoaded) {
            final state = (chatLoaded as ChatLoaded);
            return TextField(
              controller: _textController,
              onChanged: (message) {
                if (message.isNotEmpty)
                  context.read<ChatBloc>().add(MessageWritten(message));
              },
              style: Theme.of(context).textTheme.bodyMedium,
              decoration: InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.white,
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.r20),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: ColorManager.white,
                    ),
                    borderRadius: BorderRadius.circular(AppRadius.r20),
                  ),
                  fillColor: Colors.transparent,
                  hintText: AppStrings.typeAMessage,
                  suffixIcon: state.isMessageReady
                      ? IconButton(
                          onPressed: () {
                            context.read<ChatBloc>().add(MessageSent(
                                  Message(
                                      text: DateTime.now().toString(),
                                      date: '2:51',
                                      user: User(name: 'ahmad taleb', id: '1')),
                                ));
                          },
                          icon: Icon(
                            Icons.send,
                            color: ColorManager.darkGrey,
                          ))
                      : Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              onPressed: () async {
                                final ImagePicker _picker = ImagePicker();
                                // Pick an image
                                final XFile? image = await _picker.pickImage(
                                    source: ImageSource.gallery);
                                if (image != null) {
                                  print(image.path);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (_) =>
                                              PictureSendConfirmScreen(
                                                  image: image.path)));
                                  FocusManager.instance.primaryFocus?.unfocus();
                                }
                              },
                              icon: SvgPicture.asset(
                                ImageAssets.pictureIcon,
                              ),
                              padding: const EdgeInsets.all(AppPadding.p6),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon:
                                  SvgPicture.asset(ImageAssets.voiceRecordIcon),
                              padding: const EdgeInsets.all(AppPadding.p8),
                              constraints: const BoxConstraints(),
                            ),
                          ],
                        )),
            );
          },
        ),
      ),
    );
  }
}
