import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:val/presentation/common/appbar/custom_appbar.dart';
import 'package:val/presentation/common/drawer/drawer.dart';
import 'package:val/presentation/main/pages/home/view/widgets/banner/banner_item.dart';
import 'package:val/presentation/main/pages/home/view/widgets/banner/build_banner_items.dart';
import 'package:val/presentation/main/pages/home/view/widgets/story/build_story_items.dart';
import 'package:val/presentation/main/pages/home/view/widgets/story/story_item.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';



class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 10.h,
            ),
            Text(
              AppStrings.welcomeMsg,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            Text(
              AppStrings.buyStuff,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 10.h,
            ),
            const BuildStoryItems(),
            SizedBox(
              height: 24.h,
            ),
            Text(
              AppStrings.specialOffer,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            SizedBox(
              height: 10.h,
            ),
             BuildBannerItems(items: [
              BannerItem(image: 'assets/images/img.png')
            ],),
            SizedBox(
              height: 28.h,
            ),
            Text(
              AppStrings.discoverTheOffers,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ],
        ),
      );
  }
}

