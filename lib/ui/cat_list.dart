import 'package:flutter/material.dart';

import 'package:catbox/services/api.dart';
import 'package:catbox/models/cat.dart';

class CatList extends StatefulWidget {
  @override
  _CatListState createState() => _CatListState();
}

class _CatListState extends State<CatList> {
  List<Cat> _cats = [];

  @override
  void initState() {
    super.initState();
    _loadCats();
  }

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

  void _loadCats() async {
    String fileData = await DefaultAssetBundle.of(context).loadString("assets/cats.json");
    for (Cat c in CatApi.allCatsFromJson(fileData)) {
      _cats.add(c);
    }

    print(_cats.toString());
  }
}
