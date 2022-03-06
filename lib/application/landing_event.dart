part of 'landing_bloc.dart';

@immutable
abstract class LandingEvent {}

class PageChanged extends LandingEvent {
  final int pageIndex;

  PageChanged(this.pageIndex);
}
