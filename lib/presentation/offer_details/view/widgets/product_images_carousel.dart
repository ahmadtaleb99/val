import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/values_manager.dart';

class ProductImagesCarousel extends StatelessWidget {


  final List<String> images;
  @override
  Widget build(BuildContext context) {
    return CarouselSlider(
        items: images.map((image) => Container(

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(AppRadius.r4),
            image: DecorationImage(

              
              fit: BoxFit.cover,
              image: AssetImage(image)
            )
          ),
        )).toList(),
        options: CarouselOptions(
          height: 296 .h,
          viewportFraction: 1,

          initialPage: 0,
          enableInfiniteScroll: true,
          reverse: false,
          autoPlayCurve: Curves.fastOutSlowIn,
          enlargeCenterPage: true,
          onPageChanged: (index,reason){},
          scrollDirection: Axis.horizontal,
        )
    );
  }

  const ProductImagesCarousel({
    required this.images,
  });
}
