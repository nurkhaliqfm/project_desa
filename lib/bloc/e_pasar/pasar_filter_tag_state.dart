part of 'pasar_filter_tag_bloc.dart';

abstract class PasarFilterTagState {
  final String tag;

  const PasarFilterTagState(this.tag);
}

class PasarFilterTagInitial extends PasarFilterTagState {
  const PasarFilterTagInitial() : super('all');
}

class PasarFilterTagLoaded extends PasarFilterTagState {
  const PasarFilterTagLoaded(String tag) : super(tag);
}
