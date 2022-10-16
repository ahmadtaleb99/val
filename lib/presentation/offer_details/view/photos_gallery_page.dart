import 'package:easy_localization/easy_localization.dart' as local;
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:photo_view/photo_view.dart';
import 'package:photo_view/photo_view_gallery.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/constants_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';


class PhotosGalleryPage extends StatefulWidget {
  final List<String>? images;
  final int initialIndex;

  const PhotosGalleryPage({Key? key, this.images,required this.initialIndex})
      : super(key: key);

  @override
  State<PhotosGalleryPage> createState() => _PhotosGalleryPageState();
}


class _PhotosGalleryPageState extends State<PhotosGalleryPage> {

  int _currentIndex = 0 ;
  double opacity = 1.0 ;
  late final _pageController;

  @override
  void initState() {
    _currentIndex = widget.initialIndex;
    _pageController = PageController(initialPage: _currentIndex);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Dismissible(
      key: Key('gallery'),
      onUpdate: (details) => setState(() {
        print(details.progress);
        opacity = 1.0 - details.progress;
        print('opacity : $opacity');

      }),
      resizeDuration: const Duration(microseconds: 10),
      direction: DismissDirection.down,
      onDismissed: (details) => Navigator.pop(context),
      child: Opacity(
        opacity: opacity,
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
          ),
            backgroundColor: Colors.black,
            body: Stack(
              children: [
                PhotoViewGallery.builder(
                  scrollPhysics: const BouncingScrollPhysics(),
                  builder: _buildItem,
                  itemCount: widget.images!.length,

                  pageController: _pageController,
                  onPageChanged: (index) {
                    setState(() {

                      print(_currentIndex);
                   _currentIndex = index;
                    });
                  },
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 60.h),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        ...List<Widget>.generate(
                            widget.images!.length,
                                (index) => InkWell(
                                  onTap: () =>      _pageController.animateToPage(index,
                                      duration:  const Duration(
                                          milliseconds: AppConstants.carouselAnimationTransitionDelayMs),
                                      curve: Curves.easeIn),
                                  child: Padding(
                              padding:
                             const  EdgeInsets.symmetric(horizontal: AppPadding.p8),
                              child:
                              index == _currentIndex
                                    ? SvgPicture.asset(
                                    ImageAssets.solidCircle)
                                    : SvgPicture.asset(
                                    ImageAssets.hollowCircleIcon),
                            ),
                                ))
                      ],
                    ),
                  ),
                ),

              ],
            )),
      ),
    );
  }

  PhotoViewGalleryPageOptions _buildItem(BuildContext context, int index) {
    final image = widget.images![index];
    return PhotoViewGalleryPageOptions(
      imageProvider: AssetImage(image),
      initialScale: PhotoViewComputedScale.contained * (0.9),
      minScale: PhotoViewComputedScale.contained * (0.5),
      maxScale: PhotoViewComputedScale.covered * 4.1,

      heroAttributes: PhotoViewHeroAttributes(tag: image),
    );
  }
}
