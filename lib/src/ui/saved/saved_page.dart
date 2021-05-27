import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_john/src/bloc/save_bloc/save_bloc.dart';

class SavedPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SaveBloc, SaveState>(
      builder: (context, state) {
        if (state is SaveLoad) {
          return ListView.builder(
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(state.newsList[index].title),
                subtitle: Text(state.newsList[index].channelName),
              );
            },
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}
