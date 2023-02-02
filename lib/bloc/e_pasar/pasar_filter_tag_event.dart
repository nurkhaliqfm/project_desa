part of 'pasar_filter_tag_bloc.dart';

abstract class PasarFilterTagEvent {}

class AllPasarFilter extends PasarFilterTagEvent {
  final String tag;
  AllPasarFilter({this.tag = 'all'});
}

class MinumanPasarFilter extends PasarFilterTagEvent {
  final String tag;
  MinumanPasarFilter({this.tag = 'minuman'});
}

class MakananPasarFilter extends PasarFilterTagEvent {
  final String tag;
  MakananPasarFilter({this.tag = 'makanan'});
}
