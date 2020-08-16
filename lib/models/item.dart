class Item {
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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'] as int,
      name: json['name'] as String,
      itemType: json['item_type'] as String,
      askPrice: json['ask_price'] as int,
      sellPrice: json['sell_price'] as int,
      description: json['description'] as String,
      comment: json['comment'],
      attackNumber: json['attack_number'],
      defenceNumber: json['defence_number'],
      isDungeonTableMountain: json['テーブルマウンテン'] != null,
      isDungeonKakejiku: json['掛軸裏の洞窟'] != null,
      isDungeonSyokujin: json['食神のほこら'] != null,
      isDungeonFei: json['フェイの最終問題'] != null,
    );
  }

  int id;
  String name;
  String itemType;
  int askPrice;
  int sellPrice;
  String description;
  dynamic comment;
  dynamic attackNumber;
  dynamic defenceNumber;
  bool isDungeonTableMountain;
  bool isDungeonKakejiku;
  bool isDungeonSyokujin;
  bool isDungeonFei;
}
