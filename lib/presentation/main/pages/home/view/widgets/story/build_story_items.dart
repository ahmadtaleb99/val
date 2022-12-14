import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:val/presentation/resources/assets_manager.dart';
import 'package:val/presentation/resources/color_manager.dart';
import 'package:val/presentation/story/bloc/story_bloc.dart';
import 'package:val/presentation/story/view/story_screen.dart';

import '../../../../../../resources/values_manager.dart';
import 'story_item.dart';

class BuildStoryItems extends StatelessWidget {
  const BuildStoryItems({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70.h,
      child: BlocBuilder<StoryBloc, StoryState>(
        builder: (context, state) {
          if (state is StoryInitial)
            return CircularProgressIndicator();
          else if (state is StoryLoaded) {
            return ListView.builder(
                itemCount: state.stories.length,
                scrollDirection: Axis.horizontal,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: AppPadding.p4),
                    child: StoryItem(
                        onTap: () {
                          showModalBottomSheet(
                              context: context,
                              isScrollControlled:true,
                              builder: (_) {
                                final bloc = context.read<StoryBloc>();
                                bloc.add(StoryOpened(storyIndex: index));
                                return BlocProvider.value(
                                  value: bloc,
                                  child: StoryGalleryScreen(),
                                );
                              });
                          // showGeneralDialog(
                          //   barrierDismissible: false,
                          //   barrierColor: Colors.black.withOpacity(0.5),
                          //   transitionDuration: Duration(milliseconds: 400),
                          //   context: context,
                          //   pageBuilder: (_, anim1, anim2) {
                          //     final bloc = context.read<StoryBloc>();
                          //     bloc.add(StoryOpened(storyIndex: index));
                          //     return BlocProvider.value(
                          //       value:  bloc,
                          //       child: StoryGalleryScreen(),
                          //     );
                          //   },
                          //   transitionBuilder: (context, anim1, anim2, child) {
                          //     return SlideTransition(
                          //
                          //       position: Tween(
                          //           begin: Offset(0, 1), end: Offset(0, 0))
                          //           .animate(anim1),
                          //       child: child,
                          //     );
                          //   },
                          // );
                          //
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //         builder: (_) => BlocProvider.value(
                          //           value: bloc,
                          //           child: StoryGalleryScreen(
                          //           ),
                          //         )));
                        },
                        image: ImageAssets.logo,
                        color: ColorManager.secondary),
                  );
                });
          } else
            return Container();
        },
      ),
    );
  }
}
