import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:instagram_john/src/bloc/news_bloc/news_bloc.dart';
import 'package:instagram_john/src/bloc/save_bloc/save_bloc.dart';
import 'package:instagram_john/src/bloc/comment_bloc/comment_bloc.dart';
import 'package:instagram_john/src/models/news_model.dart';
import 'package:readmore/readmore.dart';

class HomeBody extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NewsBloc, NewsState>(
      builder: (context, state) {
        if (state is NewsLoaded) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: state.newsList.length,
            itemBuilder: (context, index) {
              return NewsItem(
                newsItem: state.newsList[index],
              );
            },
          );
        }
        if (state is NewsLoaded) {
          return Center(
            child: Text('Unable to load Data!'),
          );
        }
        return Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class NewsItem extends StatelessWidget {
  NewsItem({@required this.newsItem});
  final NewsModel newsItem;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            CircleAvatar(
              radius: 15.0,
              child: Icon(Icons.person),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text('${newsItem.channelName}'),
            Spacer(),
            IconButton(
              icon: Icon(Icons.more_vert),
              onPressed: () {},
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        Container(
          color: Colors.grey,
          child: Image(
            image: NetworkImage('${newsItem.photoUrl}'),
          ),
        ),
        SizedBox(
          height: 10.0,
        ),
        Row(
          children: [
            Icon(Icons.favorite_border_outlined),
            SizedBox(
              width: 10.0,
            ),
            Icon(Icons.add_comment_outlined),
            SizedBox(
              width: 10.0,
            ),
            Icon(Icons.messenger_outline_outlined),
            SizedBox(
              width: 10.0,
            ),
            Spacer(),
            BlocBuilder<SaveBloc, SaveState>(
              builder: (context, state) {
                if (state is SaveLoad) {
                  for (var k in state.newsList) {
                    if (k.id == newsItem.id) {
                      return IconButton(
                        icon: Icon(Icons.bookmark),
                        onPressed: () {
                          BlocProvider.of<SaveBloc>(context)
                              .add(UnSaveItemEvent(newsModel: newsItem));
                        },
                      );
                    }
                  }
                  return IconButton(
                    icon: Icon(Icons.bookmark_outline),
                    onPressed: () {
                      BlocProvider.of<SaveBloc>(context)
                          .add(SaveItemEvent(newsModel: newsItem));
                    },
                  );
                }
                return Center(
                  child: CircularProgressIndicator(),
                );
              },
            ),
          ],
        ),
        SizedBox(
          height: 10.0,
        ),
        //Text('${newsItem.channelName}  ${newsItem.title}'),
        ReadMoreText(
          '${newsItem.channelName} : ${newsItem.title}',
          style: TextStyle(color: Colors.black),
          trimLines: 1,
          trimLength: 30,
          colorClickableText: Colors.grey,
          trimMode: TrimMode.Line,
          trimCollapsedText: 'more',
          trimExpandedText: 'less',
          lessStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
          moreStyle: TextStyle(
              fontSize: 14, fontWeight: FontWeight.bold, color: Colors.grey),
        ),
        SizedBox(
          height: 10.0,
        ),
        BlocBuilder<CommentBloc, CommentState>(
          builder: (context, state) {
            if (state is CommentInitial) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<CommentBloc>(context)
                      .add(DisplayCommentEvent());
                },
                child: Text('View Comments'),
              );
            }
            if (state is CommentLoaded) {
              return Container(
                height: 50.0,
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: state.commentList.length,
                  itemBuilder: (context, index) {
                    return Text(
                        '${state.commentList[index].userName} : ${state.commentList[index].comment}');
                  },
                ),
              );
            }
            if (state is CommentError) {
              return InkWell(
                onTap: () {
                  BlocProvider.of<CommentBloc>(context)
                      .add(DisplayCommentEvent());
                },
                child: Text('Retry Loading Comments'),
              );
            }
            return Container(
              height: 20,
              child: Center(
                child: CircularProgressIndicator(),
              ),
            );
          },
        ),
      ],
    );
  }
}
