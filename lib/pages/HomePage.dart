import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

import '../widgets/ViewItems.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final dummyItems = [
  {
    "id": 1,
    "name": "つるはし",
    "item_type": "sword",
    "ask_price": 240,
    "sell_price": 100,
    "description": "ダンジョンの壁を掘れる",
    "comment": null,
    "attack_num": 1,
    "defence_num": null,
    "テーブルマウンテン": "○",
    "掛軸裏の洞窟": "○",
    "食神のほこら": null,
    "フェイの最終問題": "○"
  },
  {
    "id": 3,
    "name": "こん棒",
    "item_type": "sword",
    "ask_price": 240,
    "sell_price": 80,
    "description": "特になし",
    "comment": null,
    "attack_num": 2,
    "defence_num": null,
    "テーブルマウンテン": "○",
    "掛軸裏の洞窟": "○",
    "食神のほこら": null,
    "フェイの最終問題": "○"
  },
];

class _MyHomePageState extends State<HomePage> {
  Future<List> loadJsonItemList() async {
    String loadData = await rootBundle.loadString('assets/data/item_list.json');
    return json.decode(loadData);
  }

  List itemList;
  @override
  void initState() {
    super.initState();

    // TODO: 起動時はエラー、再読み込みで表示可能
    loadJsonItemList().then((jsonItems) {
      itemList = (jsonItems != null) ? jsonItems : dummyItems;
    }).catchError((e) {
      print('=================¥nJson load error : $e');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shiren Item Searcher'),
      ),
      body: ViewItems(itemList: itemList),
    );
  }
}
