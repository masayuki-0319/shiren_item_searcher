import 'package:flutter/material.dart';

import '../services/fetch_item.dart';

final _backgroundColor = Colors.green[100];
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

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
