import 'package:flutter/material.dart';
import 'package:flutterwidgets/src/notifiers/search_notifier.dart';
import 'package:flutterwidgets/src/pages/search_page.dart';
import 'package:oktoast/oktoast.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _searchNotifer = SearchNotifier();
  @override
  Widget build(BuildContext context) {
    return OKToast(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'FlutterWidgets',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: SearchPage(
          searchNotifier: _searchNotifer,
        ),
      ),
    );
  }
}