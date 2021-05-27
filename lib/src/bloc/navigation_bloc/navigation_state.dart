part of 'navigation_bloc.dart';

@immutable
abstract class NavigationState {}

class NavigationInitial extends NavigationState {
  final Widget contentWidget;
  final int selectedIndex;
  NavigationInitial(
      {@required this.contentWidget, @required this.selectedIndex});
}

class ItemSelectedState extends NavigationState {
  final Widget contentWidget;
  final int selectedIndex;
  ItemSelectedState(
      {@required this.contentWidget, @required this.selectedIndex});
}
