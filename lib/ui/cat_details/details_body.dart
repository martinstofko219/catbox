import 'package:flutter/material.dart';

import 'package:catbox/models/cat.dart';

class CatDetailsBody extends StatelessWidget {
  final Cat cat;

  CatDetailsBody(this.cat);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    var textTheme = theme.textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        Text(
          cat.name,
          style: textTheme.headline.copyWith(color: Colors.white),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 4.0),
          child: _buildLocation(context),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Text(
            cat.description,
            style: textTheme.body1.copyWith(
              color: Colors.white70,
              fontSize: 16.0,
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16.0),
          child: Row(
            children: <Widget>[
              _buildCircleBadge(Icons.share, theme.accentColor),
              _buildCircleBadge(Icons.phone, Colors.white12),
              _buildCircleBadge(Icons.email, Colors.white12),
            ],
          ),
        ),
      ],
    );
  }

  Widget _buildCircleBadge(IconData iconData, Color color) {
    return Padding(
      padding: const EdgeInsets.only(left: 8.0),
      child: CircleAvatar(
        backgroundColor: color,
        radius: 16.0,
        child: Icon(
          iconData,
          color: Colors.white,
          size: 16.0,
        ),
      ),
    );
  }

  Widget _buildLocation(BuildContext context) {
    var textTheme = Theme.of(context).textTheme;
    return Row(
      children: <Widget>[
        Icon(
          Icons.place,
          color: Colors.white,
          size: 16.0,
        ),
        Padding(
          padding: const EdgeInsets.only(left: 8.0),
          child: Text(
            cat.location,
            style: textTheme.subhead.copyWith(color: Colors.white),
          ),
        ),
      ],
    );
  }
}
