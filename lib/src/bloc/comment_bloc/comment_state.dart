part of 'comment_bloc.dart';

@immutable
abstract class CommentState {}

class CommentInitial extends CommentState {}

class CommentLoading extends CommentState {}

class CommentError extends CommentState {}

class CommentLoaded extends CommentState {
  final List<CommentModel> commentList;
  CommentLoaded({@required this.commentList});
}
