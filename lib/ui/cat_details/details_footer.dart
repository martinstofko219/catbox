import 'package:flutter/material.dart';

import 'package:catbox/models/cat.dart';

class CatShowcase extends StatefulWidget {
  final Cat cat;

  CatShowcase(this.cat);

  @override
  _CatShowcaseState createState() => _CatShowcaseState();
}

class _CatShowcaseState extends State<CatShowcase> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}