part of 'story_bloc.dart';

abstract class StoryState extends Equatable {
  const StoryState();
}

class StoryInitial extends StoryState {
  @override
  List<Object> get props => [];
}

class StoryLoading extends StoryState {
  @override
  List<Object> get props => [];
}

class StoryLoaded  extends StoryState  {

  final List<StoryMock> stories;
  final int currentStory;
  @override
  List<Object> get props => [stories];

  const StoryLoaded({
    required this.stories,
    required this.currentStory,
  });

  StoryLoaded copyWith({
    List<StoryMock>? stories,
    int? currentStory,
  }) {
    return StoryLoaded(
      stories: stories ?? this.stories,
      currentStory: currentStory ?? this.currentStory,
    );
  }
}