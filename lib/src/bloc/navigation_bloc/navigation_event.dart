part of 'navigation_bloc.dart';

@immutable
abstract class NavigationEvent {}

class ItemClickedEvent extends NavigationEvent {
  final int index;
  ItemClickedEvent({@required this.index});
}
