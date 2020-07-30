class Item {
  String id;
  String name;
  String itemType;
  int askPrice;
  int sellPrice;
  String description;
  String comment;
  int attackNumber;
  int defenceNumber;
  bool isDungeonTableMountain;
  bool isDungeonKakejiku;
  bool isDungeonSyokujin;
  bool isDungeonFei;

  Item({
    this.id,
    this.name,
    this.itemType,
    this.askPrice,
    this.sellPrice,
    this.description,
    this.comment,
    this.attackNumber,
    this.defenceNumber,
    this.isDungeonTableMountain = false,
    this.isDungeonKakejiku = false,
    this.isDungeonSyokujin = false,
    this.isDungeonFei = false,
  });

  factory Item.fromMap(Map<String, dynamic> jsonData) {
    return Item(
      id: jsonData['id'],
      name: jsonData['name'],
      itemType: jsonData['itemType'],
      askPrice: jsonData['askPrice'],
      sellPrice: jsonData['sellPrice'],
      description: jsonData['description'],
      comment: jsonData['comment'],
      attackNumber: jsonData['attackNumber'],
      defenceNumber: jsonData['defenceNumber'],
      isDungeonTableMountain: jsonData['テーブルマウンテン'] != null ? true : false,
      isDungeonKakejiku: jsonData['掛軸裏の洞窟'] != null ? true : false,
      isDungeonSyokujin: jsonData['食神のほこら'] != null ? true : false,
      isDungeonFei: jsonData['フェイの最終問題'] != null ? true : false,
    );
  }
}
