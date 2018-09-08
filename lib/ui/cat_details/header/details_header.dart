import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import 'package:catbox/models/cat.dart';
import 'package:catbox/ui/cat_details/header/diagonal_header_image.dart';

class CatDetailsHeader extends StatefulWidget {
  final Cat cat;
  final Object avatarTag;

  CatDetailsHeader(this.cat, {@required this.avatarTag});

  @override
  _CatDetailsHeaderState createState() => _CatDetailsHeaderState();
}

class _CatDetailsHeaderState extends State<CatDetailsHeader> {
  static const BACKGROUND_IMAGE = 'images/profile_header_background.png';

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;
    var screenWidth = MediaQuery.of(context).size.width;
    var diagonalBackground = DiagonalHeaderImage(
      Image.asset(
        BACKGROUND_IMAGE,
        width: screenWidth,
        height: 280.0,
        fit: BoxFit.cover,
      ),
      // color: const Color(0xBB42A5F5),
      color: theme.primaryColor.withAlpha(150),
    );

    var avatar = Hero(
      tag: widget.avatarTag,
      child: CircleAvatar(
        backgroundImage: NetworkImage(widget.cat.avatarUrl),
        radius: 64.0,
      ),
    );

    var likeInfo = Padding(
      padding: EdgeInsets.only(top: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.thumb_up,
            color: Colors.white,
            size: 16.0,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Text(
              widget.cat.likeCounter.toString(),
              style: textTheme.subhead.copyWith(color: Colors.white),
            ),
          ),
        ],
      ),
    );

    var actionButtons = Padding(
      padding: EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          ClipRRect(
            borderRadius: BorderRadius.circular(32.0),
            child: RaisedButton(
              color: theme.accentColor,
              textColor: Colors.black,
              onPressed: () async {},
              child: Text('ADOPT ME'),
            ),
          ),
          ClipRRect(
            borderRadius: BorderRadius.circular(32.0),
            child: RaisedButton(
              color: Colors.blue,
              textColor: Colors.white,
              onPressed: () async {},
              child: Text('LIKE'),
            ),
          ),
        ],
      ),
    );

    return Stack(
      children: <Widget>[
        diagonalBackground,
        Align(
          alignment: FractionalOffset.bottomCenter,
          heightFactor: 1.4,
          child: Column(
            children: <Widget>[avatar, likeInfo, actionButtons],
          ),
        ),
        Positioned(
          top: 26.0,
          left: 4.0,
          child: BackButton(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
