import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

final List<Map> dummyItems = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Shiren Item Searcher'),
      ),
      body: ViewItems(),
    );
  }
}

final _backgroundColor = Colors.green[100];
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class ViewItems extends StatelessWidget {
  const ViewItems();

  Widget _buildViewItemWidgets(List<Widget> items) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => items[index],
      itemCount: items.length,
    );
  }

  @override
  Widget build(BuildContext context) {
    final items = <ViewItem>[];

    for (var i = 0; i < dummyItems.length; i++) {
      items.add(ViewItem(item: dummyItems[i]));
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
            print('I was tapped!');
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
                    style: Theme.of(context).textTheme.headline,
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
