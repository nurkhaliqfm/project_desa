import 'package:flutter_bloc/flutter_bloc.dart';

part 'form_search_data_event.dart';
part 'form_search_data_state.dart';

class FormSearchDataBloc
    extends Bloc<FormSearchDataEvent, FormSearchDataState> {
  FormSearchDataBloc() : super(FormSearchDataInitial()) {
    on<GetSearchDataResult>((event, emit) async {
      emit(FormSearchDataLoading());
      print('Looking For Data...');
      await Future.delayed(const Duration(seconds: 4));
      print('Data Found');
      emit(FormSearchDataLoaded());
    });
  }
}
