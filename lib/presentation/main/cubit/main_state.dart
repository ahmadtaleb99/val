part of 'main_cubit.dart';

 class MainState extends Equatable {


   final int currentPageIndex;

   @override
   List<Object> get props => [currentPageIndex];

   const MainState({
     required this.currentPageIndex,
   });

   MainState copyWith({
    int? currentIndex,
  }) {
    return MainState(
      currentPageIndex: currentIndex ?? this.currentPageIndex,
    );
  }
}