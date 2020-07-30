import 'dart:convert';

import 'package:flutter/services.dart' show rootBundle;

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

Future<String> loadJsonItemList() async {
  return rootBundle.loadString('assets/data/item_list.json');
}

Future<List> fetchItemList() async {
  String jsonData = await loadJsonItemList();
  List loadData = jsonDecode(jsonData);
  return (loadData != null) ? loadData : dummyItems;
}
