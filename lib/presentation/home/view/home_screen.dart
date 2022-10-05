import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/home/view/widgets/story/story_item.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';

import '../../common/appbar/custom_appbar.dart';
import '../../common/drawer/drawer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: const  CustomAppBar(),
      drawer:  const AppDrawer(),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: 10.h,),
            Text(AppStrings.welcomeMsg,textAlign: TextAlign.center,style: Theme.of(context).textTheme.titleMedium,),
            Text(AppStrings.buyStuff,textAlign: TextAlign.center,style: Theme.of(context).textTheme.bodySmall,),
            StoryItem(image: ImageAssets.logo, color: ColorManager.primary)

          ],
        ),
      ),
    );
  }
}
