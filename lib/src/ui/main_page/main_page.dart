import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_john/src/bloc/navigation_bloc/navigation_bloc.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.camera_alt_outlined),
        title: Text('Instagram'),
        actions: [
          IconButton(
            icon: Icon(Icons.messenger_outline_sharp),
            onPressed: () {},
          ),
        ],
      ),
      body: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is ItemSelectedState) {
            return state.contentWidget;
          }
          if (state is NavigationInitial) {
            return state.contentWidget;
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
      bottomNavigationBar: BlocBuilder<NavigationBloc, NavigationState>(
        builder: (context, state) {
          if (state is NavigationInitial) {
            return BottomNavigationBar(
              onTap: (index) {
                BlocProvider.of<NavigationBloc>(context)
                    .add(ItemClickedEvent(index: index));
              },
              currentIndex: state.selectedIndex,
              items: _bnbList,
            );
          }
          if (state is ItemSelectedState) {
            return BottomNavigationBar(
              onTap: (index) {
                BlocProvider.of<NavigationBloc>(context)
                    .add(ItemClickedEvent(index: index));
              },
              currentIndex: state.selectedIndex,
              items: _bnbList,
            );
          }
          return Center(
            child: CircularProgressIndicator(),
          );
        },
      ),
    );
  }
}

final List<BottomNavigationBarItem> _bnbList = [
  BottomNavigationBarItem(
    icon: Icon(Icons.home),
    label: 'Home',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.search),
    label: 'Search',
  ),
  BottomNavigationBarItem(
    icon: Icon(Icons.bookmark),
    label: 'Bookmark',
  ),
];
