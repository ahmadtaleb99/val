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
  final int currentStoryIndex;
  final int currentImageInStory;
  final bool isLastImage;
  final bool storiesEnded;
  @override
  List<Object> get props => [stories,currentStoryIndex,currentImageInStory,storiesEnded];

  const StoryLoaded({
    required this.stories,
    required this.currentStoryIndex,
    required this.isLastImage,
    required this.currentImageInStory,
    required this.storiesEnded,
  });

  StoryLoaded copyWith({
    List<StoryMock>? stories,
    int? currentStoryIndex,
    int? currentImageInStory,
    bool? isLastImage,
    bool? storiesEnded,
  }) {
    return StoryLoaded(
      stories: stories ?? this.stories,
      currentStoryIndex: currentStoryIndex ?? this.currentStoryIndex,
      currentImageInStory: currentImageInStory ?? this.currentImageInStory,
      isLastImage: isLastImage ?? this.isLastImage,
      storiesEnded: storiesEnded ?? this.storiesEnded,
    );
  }
}