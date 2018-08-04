import 'package:flutter/material.dart';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.pink,
      body: _getAppTitleWidget(),
    );
  }

  Widget _getAppTitleWidget() {
    return Center(
      child: Text(
        'Cats',
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.w700,
          fontSize: 32.0,
        ),
      ),
    );
  }
}
