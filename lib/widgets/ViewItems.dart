import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

final _backgroundColor = Colors.green[100];
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);
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

class ViewItems extends StatelessWidget {
  static List itemList;
  const ViewItems();

  void initState() async {
    itemList = await fetchItemList();
    print('=========================-');
    print(itemList);
    print('=========================-');
  }

  Widget _buildViewItemWidgets(List<Widget> itemList) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => itemList[index],
      itemCount: itemList.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    // ここで、itemList を更新する必要がある
    initState();

    final items = <ViewItem>[];
    for (var i = 0; i < itemList.length; i++) {
      items.add(ViewItem(item: itemList[i]));
    }

    return Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildViewItemWidgets(items),
    );
  }
}

class ViewItem extends StatelessWidget {
  final Map item;

  const ViewItem({
    @required this.item,
  }) : assert(item != null);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: Container(
        height: _rowHeight,
        child: InkWell(
          borderRadius: _borderRadius,
          highlightColor: Colors.greenAccent,
          splashColor: Colors.greenAccent,
          onTap: () {
            print('Tap !');
          },
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Padding(
                  padding: EdgeInsets.all(16.0),
                  child: Image.asset(
                    'assets/images/ver_1_sfc/${item['item_type']}.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: Text(
                    item['name'],
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(children: [
                    Text(
                      '買値: ${item['ask_price'].toString()}',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    Text(
                      '売値: ${item['sell_price'].toString()}',
                      style: TextStyle(color: Colors.redAccent),
                    ),
                  ]),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
