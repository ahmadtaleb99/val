import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/common/dismissible_page.dart';
import 'package:val/presentation/offer_details/view/photos_gallery_page.dart';
import 'package:val/presentation/resources/constants_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

class OfferImagesCarousel extends StatelessWidget {
  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: List.generate(
            images.length,
            (i) => GestureDetector(
                  onTap: () {
                    showGeneralDialog(
                      barrierDismissible: false,
                      barrierColor: Colors.black.withOpacity(0.5),
                      transitionDuration: Duration(milliseconds: 400),
                      context: context,
                      pageBuilder: (_, anim1, anim2) {
                       return PhotosGalleryPage(
                         images: images,
                         initialIndex: i,
                       );
                      },
                      transitionBuilder: (context, anim1, anim2, child) {
                        return FadeTransition(
                          opacity:anim1,

                          child: child,
                        );
                      },
                    );


                  },
                  child: Hero(
                    tag: images[i],
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r4),
                          image: DecorationImage(
                              fit: BoxFit.cover, image: AssetImage(images[i]))),
                    ),
                  ),
                )).toList(),
        options: CarouselOptions(
          height: 296.h,
          viewportFraction: 1,
          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlay: true,
          autoPlayInterval: const Duration(
              seconds: AppConstants.carouselTransitionDelayInSeconds),
          autoPlayAnimationDuration: const Duration(
              milliseconds: AppConstants.carouselAnimationTransitionDelayMs),
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index, reason) {},
          scrollDirection: Axis.horizontal,
        ));
  }

  const OfferImagesCarousel({
    required this.images,
  });
}
