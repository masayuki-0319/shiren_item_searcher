import 'package:flutter/material.dart';

import '../widgets/view_items.dart';

class HomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

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
