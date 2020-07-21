import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<Map> dummyItem = [
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
];

class _MyHomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shiren Item Searcher'),
      ),
      body: Text('Hello World',
          style: TextStyle(
            color: Colors.redAccent,
            backgroundColor: Colors.black,
            fontSize: 60.0,
          )),
    );
  }
}
