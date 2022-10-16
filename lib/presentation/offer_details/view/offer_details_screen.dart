import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:val/presentation/common/appbar/custom_appbar.dart';
import 'package:val/presentation/common/buttons/custom_button_widget.dart';
import 'package:val/presentation/common/drawer/drawer.dart';
import 'package:val/presentation/offer_details/view/widgets/build_tags_list.dart';
import 'package:val/presentation/offer_details/view/widgets/chat_icon_widget.dart';
import 'package:val/presentation/offer_details/view/widgets/offer_images_carousel.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

import '../../resources/strings_manager.dart';
import 'widgets/arrow_icon_widget.dart';
import 'widgets/offer_properties_widget.dart';

class OfferDetailsScreen extends StatelessWidget {
  const OfferDetailsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: const CustomAppBar(),
      drawer: const AppDrawer(),
      body: SingleChildScrollView(
        child: Stack(
          alignment: Alignment.topRight,
          children: [
            SvgPicture.asset(
              ImageAssets.offerDetailsBackground,
              height: 540.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 102.h,
                ),
                Center(
                    child: Text(AppStrings.product,
                        style: Theme.of(context).textTheme.titleMedium)),
                SizedBox(
                  height: 14.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: AppPadding.p18),
                  child: Stack(
                    clipBehavior: Clip.none,
                    alignment: Alignment.center,
                    children: [
                      const OfferImagesCarousel(images: [
                        'assets/images/shoes_image.png',
                        'assets/images/story.png',
                        'assets/images/img.png',
                      ]),
                      Align(
                        alignment: Alignment.centerLeft,
                        child:Padding(
                          padding: const EdgeInsets.only(left: AppPadding.p8),
                          child: ArrowIconWidget(
                            icon: SvgPicture.asset(ImageAssets.leftArrowIcon),
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.centerRight,
                        child:Padding(
                          padding: const EdgeInsets.only(right: AppPadding.p8),
                          child: ArrowIconWidget(
                            icon: SvgPicture.asset(ImageAssets.rightArrowIcon),
                          ),
                        ),
                      ),
                      Positioned(
                          right: 15.w,
                          bottom: -25.h,
                          child: const ChatIconWidget())
                    ],
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: const EdgeInsets.all(AppPadding.p30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text('High Heels',
                                  style:
                                      Theme.of(context).textTheme.titleMedium),
                              SizedBox(
                                height: 6.h,
                              ),
                              Text('Shoes'),
                            ],
                          ),
                          Spacer(),
                          Text('100\$'),
                        ],
                      ),
                      SizedBox(height: 23.h),
                      Text(
                          'Velvet High Heels Are Available With A Distinctive Selection Of Shoes In Our Store'),
                    ],
                  ),
                ),
                SizedBox(height: 10.h),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p20),
                  child: OfferProperties(
                    properties: [
                      OfferPropertyViewObject(
                          label: 'Targeted Areas', value: 'Damascus'),
                      OfferPropertyViewObject(
                          label: 'Available Until', value: '2019-1-1'),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: AppPadding.p30, top: 15.h),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(AppStrings.tags),
                      SizedBox(
                        height: 10.h,
                      ),
                      const BuildTagsList(
                          tags: ['Shoes', 'High Heel', 'Velvet High Heels'])
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: AppPadding.p30, vertical: AppPadding.p16),
                    child: CustomButtonWidget(
                      color: ColorManager.warningColor,
                      text: AppStrings.sendReport,
                      onPressed: () {},
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
