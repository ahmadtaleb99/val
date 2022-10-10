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
  }

  Future<void> _onStoriesRequested(
      StoriesRequested event, Emitter<StoryState> emit) async {
    emit(StoryLoaded(stories: [
      StoryMock(
          name: 'jordan',
          category: 'shoes',
          images: ['assets/images/story.png', 'assets/images/logo.png']),
      StoryMock(
          name: 'jordan',
          category: 'shoes',
          images: ['assets/images/story.png', 'assets/images/logo.png']),
      StoryMock(
          name: 'sneakers',
          category: 'food',
          images: ['assets/images/img.png', 'assets/images/story.png']),
      StoryMock(
          name: 'sneakers',
          category: 'food',
          images: ['assets/images/img.png', 'assets/images/story.png'])
    ],
    currentStory: 0));
  }

  Future<void> _onStoryOpened(
      StoryOpened event, Emitter<StoryState> emit) async {
    final newState = (state as StoryLoaded);
    emit(newState.copyWith(currentStory: event.storyIndex));
  }
}
