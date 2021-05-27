import 'dart:io';

import 'package:flutter/material.dart';
import 'package:instagram_john/my_app.dart';
import 'package:hive/hive.dart';
import 'package:instagram_john/src/models/news_model.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final Directory document = await getApplicationDocumentsDirectory();
  Hive.init(document.path);
  Hive.registerAdapter(NewsModelAdapter());
  await Hive.openBox<NewsModel>('save_box');
  runApp(MyApp());
}
