class Food {
  int? id;
  String? name;
  String? description;
  String? image;
  String? duration;
  String? price;
  String? createdAt;
  String? updatedAt;

  Food(
      {this.id,
      this.name,
      this.description,
      this.image,
      this.duration,
      this.price,
      this.createdAt,
      this.updatedAt});

  Food.fromJson(Map<String, dynamic> json) {
    if (json['id'] is int) {
      id = json['id'];
    } else if (json['id'] is String) {
      id = int.tryParse(json['id']);
    } else {
      id = null;
    }

    name = json['name'];
    description = json['description'];
    image = json['image'];
    duration = json['duration'];
    
    if (json['price'] is String) {
      price = json['price'];
    } else if (json['price'] is num) {
      price = json['price'].toString();
    } else {
      price = null;
    }

    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['description'] = this.description;
    data['image'] = this.image;
    data['duration'] = this.duration;
    data['price'] = this.price;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}
