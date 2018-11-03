import 'package:flutter/material.dart';

import 'package:catbox/models/cat.dart';

class DetailsShowcase extends StatelessWidget {
  final Cat cat;

  DetailsShowcase(this.cat);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        'Details',
        textAlign: TextAlign.center,
      ),
    );
  }
}
