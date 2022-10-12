import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/resources/strings_manager.dart';
import 'package:val/presentation/resources/values_manager.dart';
import 'package:val/presentation/story/view/widgets/more_details_widget.dart';
import 'dart:math';

import '../../resources/constants_manager.dart';
import '../bloc/story_bloc.dart';

class StoryPage extends StatefulWidget {
  final int storyIndex;

  @override
  State<StoryPage> createState() => _StoryPageState();

  const StoryPage({
    required this.storyIndex,
  });
}

class _StoryPageState extends State<StoryPage>   with SingleTickerProviderStateMixin  {
  final _pageController = PageController();
  late AnimationController _animController;


  @override
  void initState() {
    _animController = AnimationController(vsync: this);

    _animController.duration= ( const Duration(seconds: AppConstants.storyPeriodInSeconds));
    _animController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {

        _animController.stop();
        context.read<StoryBloc>().add(
            NextImageRequested());
        _animController.reset();
        _animController.forward();

      }
    });
    _animController.forward();


    super.initState();
  }

  @override
  void dispose() {
    _animController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<StoryBloc, StoryState>(
      listener: (context,state){
        if(state is StoryLoaded) {
          _pageController.jumpToPage(state.currentImageInStory);
        }
      },

      builder: (context, _state) {


        StoryLoaded state = (_state as StoryLoaded);

        return GestureDetector(
          onTapDown: (details) {
            final screenWidth = MediaQuery.of(context).size.width;
            final screenHeight = MediaQuery.of(context).size.height;
            final dx = details.globalPosition.dx;
            final dy = details.globalPosition.dy;
            print(dx);
            if (dx > 2.6 * (screenWidth / 3) && dy > (screenHeight / 4)) {
              context.read<StoryBloc>().add(const NextImageRequested());
              _animController.reset();
              _animController.forward();
            }

          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: AppPadding.p18),
            child: Column(
              children: [
                SizedBox(
                  height: 45.h,
                ),
                Row(
                  children: [
                    ...List.generate(state.stories[state.currentStoryIndex].images.length, (index) => AnimatedBar(
                      animController: _animController,
                      position: index,
                      currentIndex: state.currentImageInStory,
                    ))
                  ],
                ),
                SizedBox(
                  height: 24.h,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(state.stories[widget.storyIndex].name,
                            style:
                            Theme.of(context).textTheme.titleMedium),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(state.stories[widget.storyIndex].category,
                            style:
                            Theme.of(context).textTheme.bodyMedium),
                      ],
                    ),
                    const Spacer(),
                    SizedBox(
                      child: InkWell(
                          child: SvgPicture.asset(ImageAssets.closeIcon),
                          onTap: () {
                            Navigator.pop(context);
                          }),
                    ),
                  ],
                ),
                Expanded(
                  child: PageView.builder(
                    controller: _pageController,
                    itemCount: state.stories[widget.storyIndex].images.length,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (context, index) {
                      return Center(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 70.h,
                            ),
                            Container(
                              height: 522.h,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(AppRadius.r4),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: AssetImage(
                                          state.stories[widget.storyIndex].images[index]))),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class AnimatedBar extends StatelessWidget {
  final AnimationController animController;
  final int position;
  final int currentIndex;



  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 1.5),
        child: LayoutBuilder(
          builder: (context, constraints) {
            return Stack(
              children: <Widget>[
                _buildContainer(
                  double.infinity,
                  position < currentIndex
                      ? Colors.white
                      : Colors.white.withOpacity(0.5),
                ),
                position == currentIndex
                    ? AnimatedBuilder(
                  animation: animController,
                  builder: (context, child) {
                    return _buildContainer(
                      constraints.maxWidth * animController.value,
                      Colors.white,
                    );
                  },
                )
                    : const SizedBox.shrink(),
              ],
            );
          },
        ),
      ),
    );
  }

  Container _buildContainer(double width, Color color) {
    return Container(
      height: 5.0,
      width: width,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: ColorManager.hintColor,
          width: 0.8,
        ),
        borderRadius: BorderRadius.circular(3.0),
      ),
    );
  }

  const AnimatedBar({
    required this.animController,
    required this.position,
    required this.currentIndex,
  });
}
