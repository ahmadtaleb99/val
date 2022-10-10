part of 'story_bloc.dart';

abstract class StoryEvent extends Equatable {
  const StoryEvent();
}


class StoriesRequested extends StoryEvent {
  @override
  List<Object?> get props => [];

}


class StoryOpened extends StoryEvent {
    final int storyIndex;
    @override
    List<Object?> get props => [storyIndex];

    const StoryOpened({
    required this.storyIndex,
  });
}