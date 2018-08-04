import 'package:flutter/material.dart';

import 'package:catbox/ui/cat_list.dart';

void main() async => runApp(CatBoxApp());

class CatBoxApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CatBox',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.greenAccent,
      ),
      home: CatList(),
    );
  }
}
