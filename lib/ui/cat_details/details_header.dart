import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:catbox/models/cat.dart';

class CatDetailsHeader extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailsHeader(this.cat, {@required this.avatarTag});

  @override
  _CatDetailsHeaderState createState() => _CatDetailsHeaderState();
}

class _CatDetailsHeaderState extends State<CatDetailsHeader> {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
  }
}