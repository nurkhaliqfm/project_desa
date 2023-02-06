part of 'identitas_desa_bloc.dart';

abstract class IdentitasDesaState {}

class IdentitasDesaInitial extends IdentitasDesaState {}

class IdentitasDesaLoading extends IdentitasDesaState {}

class IdentitasDesaSuccess extends IdentitasDesaState {
  final List<IdentitasDesa> identitasDesa;

  IdentitasDesaSuccess({
    required this.identitasDesa,
  });
}
