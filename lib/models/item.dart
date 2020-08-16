class Item {
  int id;
  String name;
  String itemType;
  int askPrice;
  int sellPrice;
  String description;
  String comment;
  dynamic attackNumber;
  dynamic defenceNumber;
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

  factory Item.fromJson(Map<String, dynamic> json) {
    return Item(
      id: json['id'],
      name: json['name'],
      itemType: json['item_type'],
      askPrice: json['ask_price'],
      sellPrice: json['sell_price'],
      description: json['description'],
      comment: json['comment'],
      attackNumber: json['attack_number'],
      defenceNumber: json['defence_number'],
      isDungeonTableMountain: json['テーブルマウンテン'] != null ? true : false,
      isDungeonKakejiku: json['掛軸裏の洞窟'] != null ? true : false,
      isDungeonSyokujin: json['食神のほこら'] != null ? true : false,
      isDungeonFei: json['フェイの最終問題'] != null ? true : false,
    );
  }
}
