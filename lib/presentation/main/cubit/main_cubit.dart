import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainState(currentPageIndex: 0));


  void changePage(int index) {
    emit(state.copyWith(currentIndex: index));
  }

}
