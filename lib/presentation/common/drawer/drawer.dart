import 'package:circular_reveal_animation/circular_reveal_animation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/app/authtication_bloc/authentication_bloc.dart';
import 'package:val/presentation/common/drawer/widgets/drawer_item.dart';
import 'package:val/presentation/common/drawer/widgets/drawer_profile_widget.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:ui' as ui;

import '../../welcome_screen/view/welcome_screen.dart';

class AppDrawer extends StatefulWidget {
  const AppDrawer({Key? key}) : super(key: key);

  @override
  State<AppDrawer> createState() => _AppDrawerState();
}

class _AppDrawerState extends State<AppDrawer>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;
    @override
  void dispose() {

      animationController.reverse();
      animationController.dispose();

      super.dispose();
    }
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );
    animation = CurvedAnimation(
      parent: animationController,
      curve: Curves.easeIn,
    );

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {
    return
      CircularRevealAnimation(
        centerAlignment: Alignment.topLeft,
        animation: animation,
        child: SizedBox(

          child: Stack(
            children: [
              CustomPaint(

                painter: RPSCustomPainter(),
                size: Size(422,(422*1.8710280373831774).toDouble()),
                child: Container(
                ),
              ),
              Column(
                children: [
                  SizedBox(height: 10.h,),
                  const DrawerProfileWidget(),
                  SizedBox(height: 16.h,),
                  Padding(
                    padding:  EdgeInsets.symmetric(horizontal: 36.w),
                    child: const Divider(),
                  ),
                  Column(
                    children: [
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.home), title: AppStrings.home,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.categories,width: 100,height: 124), title: AppStrings.categories,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.stores), title: AppStrings.stores,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.interests), title: AppStrings.interests,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.addOffer), title: AppStrings.addOffer,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.history), title: AppStrings.history,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.chats), title: AppStrings.chats,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.myOffers), title: AppStrings.myOffers,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.settings), title: AppStrings.settings,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.aboutUs), title: AppStrings.aboutUs,onTap: (){
                      },),
                      DrawerItem(icon: SvgPicture.asset(ImageAssets.login), title: AppStrings.login,onTap: (){
                      },),
                    ],
                  )


                ],
              )
            ],
          ),
        ),
      );
  }
}





