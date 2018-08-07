import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:catbox/models/cat.dart';
import 'package:catbox/ui/cat_details/details_header.dart';

class CatDetailsPage extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailsPage(
    this.cat, {
    @required this.avatarTag,
  });

  @override
  _CatDetailsPageState createState() => _CatDetailsPageState();
}

class _CatDetailsPageState extends State<CatDetailsPage> {
  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var linearGradient = BoxDecoration(
      gradient: LinearGradient(
          begin: FractionalOffset.centerRight,
          end: FractionalOffset.bottomLeft,
          colors: [
            theme.primaryColor,
            theme.primaryColorDark,
          ]),
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          decoration: linearGradient,
          child: Column(
            children: <Widget>[
              CatDetailsHeader(widget.cat, avatarTag: widget.avatarTag)
            ],
          ),
        ),
      ),
    );
  }
}
