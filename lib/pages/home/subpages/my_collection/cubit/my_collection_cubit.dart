import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'my_collection_state.dart';

class MyCollectionCubit extends Cubit<MyCollectionState> {
  MyCollectionCubit() : super(const MyCollectionState.initialState());

  void searchCardTextChanged(String value) {
    emit(state.copyWith(
      searchCardText: value,
    ));
  }

  @override
  void onChange(Change<MyCollectionState> change) {
    // TODO: implement onChange
    super.onChange(change);
  }
}
