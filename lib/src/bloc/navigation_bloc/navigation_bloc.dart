import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:instagram_john/src/ui/home/home_page.dart';
import 'package:instagram_john/src/ui/saved/saved_page.dart';
import 'package:instagram_john/src/ui/search/search_page.dart';
import 'package:meta/meta.dart';

part 'navigation_event.dart';
part 'navigation_state.dart';

class NavigationBloc extends Bloc<NavigationEvent, NavigationState> {
  NavigationBloc()
      : super(NavigationInitial(contentWidget: HomePage(), selectedIndex: 0));

  final List<Widget> _contentList = [
    HomePage(),
    SearchPage(),
    SavedPage(),
  ];

  @override
  Stream<NavigationState> mapEventToState(
    NavigationEvent event,
  ) async* {
    if (event is ItemClickedEvent) {
      yield ItemSelectedState(
          contentWidget: _contentList[event.index], selectedIndex: event.index);
    }
  }
}
