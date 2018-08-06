import 'dart:async';
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
      body: _buildBody(),
    );
  }

  Future<Null> refresh() {
    _loadCats();
    return Future<Null>.value();
  }

  Widget _buildBody() {
    return Container(
      margin: const EdgeInsets.fromLTRB(8.0, 56.0, 8.0, 0.0),
      child: Column(
        children: <Widget>[
          _getAppTitleWidget(),
          _getListViewWidget(),
        ],
      ),
    );
  }

  Widget _getListViewWidget() {
    return Flexible(
      child: RefreshIndicator(
        onRefresh: refresh,
        child: ListView.builder(
          physics: const AlwaysScrollableScrollPhysics(),
          itemCount: _cats.length,
          itemBuilder: _getListViewItem,
        ),
      ),
    );
  }

  Widget _getListViewItem(BuildContext context, int index) {
    Cat cat = _cats[index];

    return Container(
      margin: const EdgeInsets.only(top: 4.0),
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            ListTile(
              leading: Hero(
                tag: index,
                child: CircleAvatar(
                  backgroundImage: NetworkImage(cat.avatarUrl),
                ),
              ),
              title: Text(
                cat.name,
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: Colors.black54),
              ),
              subtitle: Text(cat.description),
              isThreeLine: true,
              dense: false,
            ),
          ],
        ),
      ),
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
    String fileData =
        await DefaultAssetBundle.of(context).loadString("assets/cats.json");
    setState(() {
      _cats = CatApi.allCatsFromJson(fileData);
    });
  }
}
