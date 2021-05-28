import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:instagram_john/src/models/comment_model.dart';
import 'package:instagram_john/src/repositories/comment_repository.dart';
import 'package:meta/meta.dart';

part 'comment_event.dart';
part 'comment_state.dart';

class CommentBloc extends Bloc<CommentEvent, CommentState> {
  final CommentRepository commentRepository;
  CommentBloc({@required this.commentRepository}) : super(CommentInitial());

  @override
  Stream<CommentState> mapEventToState(
    CommentEvent event,
  ) async* {
    if (event is DisplayCommentEvent) {
      yield CommentLoading();
      try {
        final String commentJsonString =
            await commentRepository.getJsonString();
        final List<CommentModel> commentList =
            commentRepository.jsonParser(commentJsonString);
        yield CommentLoaded(commentList: commentList);
      } catch (e) {
        print(e);
        yield CommentError();
      }
    }
  }
}
