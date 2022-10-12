import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:val/presentation/story/view/story_screen.dart';

part 'story_event.dart';
part 'story_state.dart';

class StoryBloc extends Bloc<StoryEvent, StoryState> {
  StoryBloc() : super(StoryInitial()) {
    on<StoriesRequested>(_onStoriesRequested);
    on<StoryOpened>(_onStoryOpened);
    on<NextImageRequested>(_onNextImageRequested);
  }

  Future<void> _onStoriesRequested(
      StoriesRequested event, Emitter<StoryState> emit) async {
    emit(StoryLoaded(stories: [
      StoryMock(
          name: 'jordan1',
          category: 'shoes1',
          images: ['assets/images/story.png', 'assets/images/logo.png','assets/images/profile.png']),
      StoryMock(
          name: 'jordan2',
          category: 'shoes2',
          images: ['assets/images/story.png', 'assets/images/logo.png']),
      StoryMock(
          name: 'sneakers3',
          category: 'food3',
          images: ['assets/images/img.png', 'assets/images/story.png','assets/images/profile.png']),
      StoryMock(
          name: 'sneakers4',
          category: 'foo4d4',
          images: ['assets/images/img.png', 'assets/images/story.png'])
    ],
    currentStoryIndex: 0,
      currentImageInStory: 0,
      isLastImage: false, storiesEnded: false,

    ));
  }

  Future<void> _onStoryOpened(
      StoryOpened event, Emitter<StoryState> emit) async {
    print('firest');
    final newState = (state as StoryLoaded);
    emit(newState.copyWith(currentStoryIndex: event.storyIndex,currentImageInStory: 0,isLastImage: false,storiesEnded: false));
  }



  Future<void> _onNextImageRequested(
      NextImageRequested event, Emitter<StoryState> emit) async {
    final newState = (state as StoryLoaded);
    if(_isLastImageInStory(newState)) {
      if(_isLastStory(newState))
        emit(newState.copyWith(storiesEnded: true));

      else emit(newState.copyWith(isLastImage: true,currentImageInStory: 0,currentStoryIndex:_getNextStoryIndex(newState)));
    } else emit(newState.copyWith(currentImageInStory: newState.currentImageInStory +1 ));
  }


  bool _isLastImageInStory(StoryLoaded state) {
    return state.currentImageInStory == state.stories[state.currentStoryIndex].images.length-1;
  }
  bool _isLastStory(StoryLoaded state) {
    return state.currentStoryIndex == state.stories.length-1;
  }

  int _getNextStoryIndex(StoryLoaded state){
    if(state.currentStoryIndex == state.stories.length -1 )
      return state.currentStoryIndex;

    return state.currentStoryIndex +1 ;
  }

  int _getPreviousStoryIndex(StoryLoaded state){
    if(state.currentStoryIndex == 0 )
      return state.currentStoryIndex;

    return state.currentStoryIndex -1 ;
  }
}


