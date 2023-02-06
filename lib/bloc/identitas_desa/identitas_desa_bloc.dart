import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project_desa/models/identitas_desa.dart';
import 'package:http/http.dart' as http;

part 'identitas_desa_event.dart';
part 'identitas_desa_state.dart';

class IdentitasDesaBloc extends Bloc<IdentitasDesaEvent, IdentitasDesaState> {
  IdentitasDesaBloc() : super(IdentitasDesaInitial()) {
    on<GetIdentitasDesa>((event, emit) async {
      emit(IdentitasDesaLoading());
      final response = await http
          .get(Uri.parse('http://192.168.0.163:5000/identitas_desa/1'));
      emit(IdentitasDesaSuccess(
          identitasDesa: identitasDesaFromJson(response.body)));
    });
  }
}
