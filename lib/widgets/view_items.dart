import 'package:flutter/material.dart';

import '../models/item.dart';
import '../services/fetch_item_list.dart';

final _backgroundColor = Colors.green[100];
final _rowHeight = 100.0;
final _borderRadius = BorderRadius.circular(_rowHeight / 2);

class ViewItems extends StatelessWidget {
  const ViewItems();

  static List<ViewItem> viewItems = [];

  void initState() async {
    List itemList = await fetchItemList();

    itemList.forEach((jsonItem) {
      Item _item = Item.fromJson(jsonItem);
      ViewItem _viewItem = ViewItem(item: _item);
      viewItems.add(_viewItem);
    });
  }

  @override
  Widget build(BuildContext context) {
    // ここで、itemList を取得する必要がある
    // TODO: 起動後、reloadしないとデータが読み込まれない
    initState();

    return Container(
      color: _backgroundColor,
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: _buildViewItemWidgets(viewItems),
    );
  }

  Widget _buildViewItemWidgets(List<Widget> itemList) {
    return ListView.builder(
      itemBuilder: (BuildContext context, int index) => itemList[index],
      itemCount: itemList.length,
    );
  }
}

class ViewItem extends StatelessWidget {
  final Item item;

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
                    'assets/images/ver_1_sfc/${item.itemType}.png',
                    fit: BoxFit.contain,
                  ),
                ),
                Center(
                  child: Text(
                    item.name,
                    textAlign: TextAlign.center,
                    style: Theme.of(context).textTheme.headline5,
                  ),
                ),
                Align(
                  alignment: Alignment.bottomRight,
                  child: Row(children: [
                    Text(
                      '買値: ${item.askPrice.toString()}',
                      style: TextStyle(color: Colors.blueAccent),
                    ),
                    Text(
                      '売値: ${item.sellPrice.toString()}',
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
