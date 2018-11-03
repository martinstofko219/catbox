import 'package:flutter/material.dart';

import 'package:catbox/models/cat.dart';

class CattributesShowcase extends StatelessWidget {
  final Cat cat;

  CattributesShowcase(this.cat);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Cattributes',
        textAlign: TextAlign.center,
      ),
    );
  }
}
