class Item {
  final int? id;
   String name;
   int isDone;
  Item({this.id, this.name = '',this.isDone=0});

  factory Item.fromMap(Map<String, dynamic> json) {
    return new Item(id: json['id'], name: json['name'],isDone:json['isDone']);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'isDone':isDone
    };
  }
}
