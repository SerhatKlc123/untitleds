class ProductModel {
  String? title;
  String? description;
  int? price;
  String? thumbnail;

  ProductModel({this.title, this.description, this.price, this.thumbnail});

  ProductModel.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    description = json['description'];
    price = json['price'];
    thumbnail = json['thumbnail'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['description'] = this.description;
    data['price'] = this.price;
    data['thumbnail'] = this.thumbnail;
    return data;
  }
}
