import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/common/buttons/custom_button_widget.dart';
import 'package:val/presentation/resources/color_manager.dart';

import '../../../domain/model/models.dart';
import '../../resources/strings_manager.dart';
import '../bloc/chat_bloc.dart';

class PictureSendConfirmScreen extends StatelessWidget {
  final String image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        appBar: AppBar(
          backgroundColor: Colors.black,
        ),
        body: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              height: 300.h,
              decoration: BoxDecoration(
                  image: DecorationImage(image: FileImage(File(image)))),
            ),
           SizedBox(height: 50.h,),
           CustomButtonWidget(color:ColorManager.secondary,text: AppStrings.send,onPressed: (){
             context.read<ChatBloc>().add(MessageSent(  Message(
                 text: DateTime.now().toString(),
                 date: '2:51',
                 media: image,
                 user: User(name: 'ahmad taleb', id: '0')),));
             Navigator.pop(context);
           },)
          ],
        ));
  }

  const PictureSendConfirmScreen({
    required this.image,
  });
}
