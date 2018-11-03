import 'package:flutter/material.dart';

import 'package:catbox/models/cat.dart';

class PicturesShowcase extends StatelessWidget {
  final Cat cat;

  PicturesShowcase(this.cat);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Pictures',
        textAlign: TextAlign.center,
      ),
    );
  }
}
