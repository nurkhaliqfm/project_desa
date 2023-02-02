import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'pasar_filter_tag_event.dart';
part 'pasar_filter_tag_state.dart';

class PasarFilterTagBloc
    extends Bloc<PasarFilterTagEvent, PasarFilterTagState> {
  PasarFilterTagBloc() : super(const PasarFilterTagInitial()) {
    on<AllPasarFilter>((event, emit) {
      emit(PasarFilterTagLoaded(event.tag));
    });
    on<MinumanPasarFilter>((event, emit) {
      emit(PasarFilterTagLoaded(event.tag));
    });
    on<MakananPasarFilter>((event, emit) {
      emit(PasarFilterTagLoaded(event.tag));
    });
  }
}
