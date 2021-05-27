import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hive/hive.dart';
import 'package:instagram_john/src/bloc/navigation_bloc/navigation_bloc.dart';
import 'package:instagram_john/src/bloc/news_bloc/news_bloc.dart';
import 'package:instagram_john/src/bloc/save_bloc/save_bloc.dart';
import 'package:instagram_john/src/models/news_model.dart';
import 'package:instagram_john/src/repositories/db_client.dart';
import 'package:instagram_john/src/repositories/db_repository.dart';
import 'package:instagram_john/src/repositories/network_client.dart';
import 'package:instagram_john/src/repositories/network_repository.dart';
import 'package:instagram_john/src/ui/home/home_page.dart';
import 'package:http/http.dart' as http;
import 'package:instagram_john/src/ui/main_page/main_page.dart';

import 'src/bloc/news_bloc/news_bloc.dart';

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  NetworkRepository _networkRepository;
  @override
  void initState() {
    super.initState();
    _networkRepository = NetworkRepository(
        networkClient: NetworkClient(httpClient: http.Client()));
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(networkRepository: _networkRepository)
            ..add(InitTriggerEvent()),
        ),
        BlocProvider<NavigationBloc>(
          create: (context) => NavigationBloc(),
        ),
        BlocProvider<SaveBloc>(
          create: (context) => SaveBloc(
            dbRepository: DbRepository(
              dbClient: DbClient(
                sBox: Hive.box<NewsModel>('save_box'),
              ),
            ),
          )..add(SaveInitEvent()),
        ),
      ],
      child: MyMaterial(),
    );
  }
}

class MyMaterial extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
