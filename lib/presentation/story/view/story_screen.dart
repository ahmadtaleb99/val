import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';

import '../bloc/story_bloc.dart';

class StoryGalleryScreen extends StatefulWidget {
  @override
  State<StoryGalleryScreen> createState() => _StoryGalleryScreenState();
}

class _StoryGalleryScreenState extends State<StoryGalleryScreen> {
  final _pageController = PageController();
  static dynamic currentPageValue = 0.0;
  @override
  void initState() {
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(gradient: ColorManager.storyGradient),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocSelector<StoryBloc, StoryState, List<StoryMock>>(
          selector: (state) => (state as StoryLoaded).stories,
          builder: (context, state) {
            return Stack(
              children: [
                PageView.builder(
                    controller: _pageController,
                    itemCount: state.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      if (index == currentPageValue.floor()) {
                        return Transform(
                          transform: Matrix4.identity()
                            ..rotateX(currentPageValue - index),
                          child: StoryPage(
                            storyIndex: index,
                          ),
                        );
                      } else
                        return Transform(
                          transform: Matrix4.identity()
                            ..rotateX(currentPageValue - index),
                          child: StoryPage(
                            storyIndex: index,
                          ),
                        );
                    }),
                Positioned(
                    bottom: 10,
                    left: 50,
                    child: SvgPicture.asset(ImageAssets.detailsArrow))
              ],
            );
          },
        ),
      ),
    );
  }
}

class StoryPage extends StatefulWidget {
  final int storyIndex;

  @override
  State<StoryPage> createState() => _StoryPageState();

  const StoryPage({
    required this.storyIndex,
  });
}

class _StoryPageState extends State<StoryPage> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocSelector<StoryBloc, StoryState, List<StoryMock>>(
      selector: (state) => (state as StoryLoaded).stories,
      builder: (context, state) {
        return GestureDetector(
          onTapUp: (details) {
            final screenWidth = MediaQuery.of(context).size.width;
            final dx = details.globalPosition.dx;
            if (dx > 2.7 * (screenWidth / 3))
              _pageController.animateToPage(1,
                  duration: Duration(milliseconds: 400), curve: Curves.easeIn);
          },
          child: PageView.builder(
            controller: _pageController,
            itemCount: state[widget.storyIndex].images.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(state[widget.storyIndex].name),
                    Container(
                      height: 522.h,
                      margin: const EdgeInsets.symmetric(
                          horizontal: AppPadding.p18),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(AppRadius.r4),
                          image: DecorationImage(
                              fit: BoxFit.cover,
                              image: AssetImage(
                                  state[widget.storyIndex].images[index]))),
                    ),
                  ],
                ),
              );
            },
          ),
        );
      },
    );
  }
}

class StoryMock {
  final String name;
  final String category;

  final List<String> images;

  const StoryMock({
    required this.name,
    required this.category,
    required this.images,
  });
}
// onTapUp: (details) {
// final screenWidth = MediaQuery
//     .of(context)
//     .size
//     .width;
// final dx = details.globalPosition.dx;
// if (dx > 2.7 * (screenWidth / 3))
// _pageController.animateToPage(1,
// duration: Duration(milliseconds: 400), curve: Curves.easeIn);
// },
