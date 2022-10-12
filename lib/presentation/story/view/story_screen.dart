import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/main/main_screen.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/story/view/story_page.dart';
import 'package:val/presentation/story/view/widgets/more_details_widget.dart';
import 'dart:math';
import '../../resources/constants_manager.dart';
import '../bloc/story_bloc.dart';
class CustomPanGestureRecognizer extends OneSequenceGestureRecognizer {
  final Function onPanDown;
  final Function onPanUpdate;
  final Function onPanEnd;



  @override
  void addPointer(PointerEvent event) {
    if (onPanDown(event.position)) {
      startTrackingPointer(event.pointer);
      resolve(GestureDisposition.accepted);
    } else {
      stopTrackingPointer(event.pointer);
    }
  }

  @override
  void handleEvent(PointerEvent event) {
    if (event is PointerMoveEvent) {
      onPanUpdate(event.position);
    }
    if (event is PointerUpEvent) {
      onPanEnd(event.position);
      stopTrackingPointer(event.pointer);
    }
  }

  @override
  String get debugDescription => 'customPan';

  @override
  void didStopTrackingLastPointer(int pointer) {}

   CustomPanGestureRecognizer({
    required this.onPanDown,
    required this.onPanUpdate,
    required this.onPanEnd,
  });


}

class AllowMultipleVerticalDragGestureRecognizer extends VerticalDragGestureRecognizer{


  @override
  void rejectGesture(int pointer) {
    acceptGesture(pointer);
  }
}
class StoryGalleryScreen extends StatefulWidget {
  @override
  State<StoryGalleryScreen> createState() => _StoryGalleryScreenState();
}

class _StoryGalleryScreenState extends State<StoryGalleryScreen> {
  double _moreDetailsOriginalPosition = 35.h;
  double _moreDetailsPosition = 35.h;
  double _moreDetailsOpacity = 1.0;
  late final _pageController;
  static dynamic currentPageValue = 0.0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    print((context.read<StoryBloc>().state as StoryLoaded).currentStoryIndex);
    _pageController = PageController(
        initialPage:
            (context.read<StoryBloc>().state as StoryLoaded).currentStoryIndex);
    _pageController.addListener(() {
      setState(() {
        currentPageValue = _pageController.page;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return RawGestureDetector(
      gestures: {
        AllowMultipleVerticalDragGestureRecognizer: GestureRecognizerFactoryWithHandlers<
            AllowMultipleVerticalDragGestureRecognizer>(
              () => AllowMultipleVerticalDragGestureRecognizer(),
              (AllowMultipleVerticalDragGestureRecognizer instance) {
            instance..onUpdate = _moreDetailsSwipeUpHandler;
            instance..onEnd = _moreDetailsSwipeEnd;
          },
        )
      },
      // onVerticalDragUpdate: _moreDetailsSwipeUpHandler,
      // onVerticalDragEnd: _moreDetailsSwipeEnd,
      child: Dismissible(
        resizeDuration: const Duration(milliseconds: 50),
        direction: DismissDirection.down,

        key: const Key('store_screen'),
        onDismissed: (_) => Navigator.of(context).pop(),
        child: Container(
          decoration: const BoxDecoration(gradient: ColorManager.storyGradient),
          child: Scaffold(
            backgroundColor: Colors.transparent,
            body: BlocListener<StoryBloc, StoryState>(
              listener: (context, state) {
                if (state is StoryLoaded) {
                  if (state.isLastImage)
                    _pageController.animateToPage(state.currentStoryIndex,
                        duration: const Duration(
                            milliseconds: AppConstants.storyTransitionDelayMs),
                        curve: Curves.easeIn);

                  if (state.storiesEnded) Navigator.pop(context);
                }
              },
              child: BlocSelector<StoryBloc, StoryState, List<StoryMock>>(
                selector: (state) => (state as StoryLoaded).stories,
                builder: (context, state) {
                  return Stack(
                    children: [
                      PageView.builder(
                          controller: _pageController,
                          itemCount: state.length,
                          scrollDirection: Axis.horizontal,
                          onPageChanged: (storyIndex) {
                            context
                                .read<StoryBloc>()
                                .add(StoryOpened(storyIndex: storyIndex));
                          },
                          itemBuilder: (context, index) {
                            if (index == currentPageValue.floor()) {
                              return Transform(
                                transform: Matrix4.identity()
                                  ..rotateX(currentPageValue - index),
                                child: StoryPage(
                                  storyIndex: index,
                                ),
                              );
                            } else if (index == currentPageValue.floor() + 1) {
                              return Transform(
                                transform: Matrix4.identity()
                                  ..rotateX(currentPageValue - index),
                                child: StoryPage(
                                  storyIndex: index,
                                ),
                              );
                            } else {
                              print(currentPageValue);

                              return StoryPage(
                                storyIndex: index,
                              );
                            }
                          }),
                      Positioned(
                          bottom: _moreDetailsPosition,
                          right: 160.w,
                          child: Opacity(
                              opacity: _moreDetailsOpacity,
                              child: const MoreDetailsWidget()))
                    ],
                  );
                },
              ),
            ),
          ),
        ),
      ),
    );
  }

  _moreDetailsSwipeUpHandler(DragUpdateDetails details) {

    final screenHeight = MediaQuery.of(context).size.height;
    int sensitivity = -2;
    //swipe down
    double newPosition = max(0, _moreDetailsPosition - (details.delta.dy));
    print(details.localPosition.dy.toString()+'new');

    if (details.delta.dy > sensitivity  ) {
      if(details.localPosition.dy   > 500 )

      {
        print('akbr');
        if (!(newPosition < _moreDetailsOriginalPosition))
          setState(() {
            _moreDetailsPosition = newPosition;
            _moreDetailsOpacity = ((details.globalPosition.dy) / 1000);
          });
      }

      //swipe up
    } else if (details.delta.dy < -sensitivity) {

      if(details.globalPosition.dy   > screenHeight - (screenHeight / 9))
        setState(() {
        _moreDetailsPosition =
            max(0, _moreDetailsPosition - (details.delta.dy));

        _moreDetailsOpacity = ((details.globalPosition.dy) / 1000);
      });
    }
  }

  _moreDetailsSwipeEnd(DragEndDetails details) {
    setState(() {
      _moreDetailsPosition = 35.h;
      _moreDetailsOpacity = 1.0;
    });
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
