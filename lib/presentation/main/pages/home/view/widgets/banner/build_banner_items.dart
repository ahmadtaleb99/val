import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/main/pages/home/view/widgets/banner/banner_item.dart';
import 'package:val/presentation/resources/constants_manager.dart';
class BuildBannerItems extends StatelessWidget {

  final List<BannerItem> items;


  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: items,
        options: CarouselOptions(
          height: 310.h,
          viewportFraction: 0.78,

          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(seconds: AppConstants.carouselTransitionDelayInSeconds),
          autoPlayAnimationDuration:  const Duration(milliseconds: AppConstants.carouselAnimationTransitionDelayMs),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index,reason){},
          scrollDirection: Axis.horizontal,
        )
    );
  }

  const BuildBannerItems({
    required this.items,
  });
}
